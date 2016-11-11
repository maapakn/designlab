module Spree	
	class Pedido < Spree::Base
    include Filterable
    has_many :pictures, :dependent => :destroy
    has_many :pedidos_dientes, :dependent => :destroy
    has_many :dientes, through: :pedidos_dientes
    belongs_to :dentist
	  belongs_to :trabajo 
	  belongs_to :material
	  belongs_to :user
    before_save :valores_por_default


    validates_presence_of :nombres, :on => :create, length:{in:4..30, 
       too_short:"ingresado es demasiado corto (3 caracteres minimo)", 
       too_long:"ingresado es demasiado largo"}
    validates_presence_of :apellidos, :on => :create, length:{in:4..30, 
       too_short:"ingresado es demasiado corto (3 caracteres minimo)", 
       too_long:"ingresado es demasiado largo"}
    validates_presence_of :trabajo, :on => :create
    validates_presence_of :material, :on => :create
    
    #imagen de observacion  	  
    accepts_nested_attributes_for :pictures, :reject_if => lambda { |t| t['trip_image'].nil? }

    #imagen de respuesta al usuario
    has_attached_file :image, styles: { medium: "1280x720", thumb:"800x600", small: "568x400" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

    mount_uploader :file, FileUploader
    validates :file, file_size: { less_than: 5.megabytes }
    
    after_create :save_dientes

    def dientes=(value)
      @dientes = value
    end

    private

    def valores_por_default
      self.estado_pago ||=1
      self.state ||='Pago Recibido'
    end

    def save_dientes
      @dientes.each do |diente_id|
        PedidosDiente.create(diente_id: diente_id, pedido_id: self.id)
      end
    end
	end
end
