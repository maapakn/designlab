module Spree
  class User < Spree::Base
    include UserAddress
    include UserPaymentSource

    devise :database_authenticatable, :registerable, :recoverable,
           :rememberable, :trackable, :validatable, :encryptable, :encryptor => 'authlogic_sha512'
    devise :confirmable if Spree::Auth::Config[:confirmable]

    acts_as_paranoid
    after_destroy :scramble_email_and_password

    has_many :pedidos, dependent: :destroy
    has_many :transactions, dependent: :destroy

    before_validation :set_login

    users_table_name = User.table_name
    roles_table_name = Role.table_name

    validates :nombre, presence: true, length:{in:4..30, 
      too_short:"Revisa el nombre ingresado, parece demasiado corto", 
      too_long:"Revisa el nombre ingresado, parece demasiado largo"}
    validates :rut, rut: true, uniqueness: {case_sensitive: false ,message: "ya existe"}
    validates_format_of :rut,
                        :with => /\A(\d{1,3})\.(\d{3})\.(\d{3})\-(k|\d{1})\Z/i,
                        :message => "Formato no Valido EJ: 12.345.678-k"
    validates :direccion, presence: true
    validates :telefono, presence: true, numericality: true

    def costo_compra_pendiente
      pedidos.where(estado_pago: 1).joins(:material).sum("price")  
    end
    def costo_compra_pendientes
      pedidos.where(estado_pago: 1).joins(:material).sum("precio")  
    end
    def total_sale
      pedidos.where(estado_pago: 2).joins(:material).sum("price")
    end
    def total_sales
      pedidos.where(estado_pago: 2).joins(:material).sum("precio")
    end

    scope :admin, -> { includes(:spree_roles).where("#{roles_table_name}.name" => "admin") }

    def self.admin_created?
      User.admin.count > 0
    end

    def admin?
      has_spree_role?('admin')
    end

    protected
      def password_required?
        !persisted? || password.present? || password_confirmation.present?
      end

    private

      def set_login
        # for now force login to be same as email, eventually we will make this configurable, etc.
        self.login ||= self.email if self.email
      end

      def scramble_email_and_password
        self.email = SecureRandom.uuid + "@example.net"
        self.login = self.email
        self.password = SecureRandom.hex(8)
        self.password_confirmation = self.password
        self.save
      end
  end
end
