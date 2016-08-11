module Spree	
	class Pedido < Spree::Base
	  belongs_to :trabajo 
	  belongs_to :material
	  belongs_to :user
	  belongs_to :diente
    before_save :valores_por_default

    scope :id_like, -> (id) { where("id = ?", id)}

    validates_presence_of :nombres, :on => :create, length:{in:4..30, 
       too_short:"ingresado es demasiado corto (3 caracteres minimo)", 
       too_long:"ingresado es demasiado largo"}
    validates_presence_of :apellidos, :on => :create, length:{in:4..30, 
       too_short:"ingresado es demasiado corto (3 caracteres minimo)", 
       too_long:"ingresado es demasiado largo"} 
    validates_presence_of :diente, :on => :create
    validates_presence_of :trabajo, :on => :create
    validates_presence_of :material, :on => :create
      	  
    has_attached_file :cover, styles: { medium: "1280x720", thumb:"800x600" }
    validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

    has_attached_file :image, styles: { medium: "1280x720", thumb:"800x600", small: "568x400" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

    mount_uploader :file, FileUploader
    validates :file, file_size: { less_than: 5.megabytes }
    
    private

    def valores_por_default
      self.estado_pago ||=1
      self.state ||='Pago Recibido'
    end
	end
end
