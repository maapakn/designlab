module Spree
	class Picture < Spree::Base
	  belongs_to :pedido
	  has_attached_file :cover, styles: { medium: "1280x720", thumb:"600x400" }
	  # Validate content type
	  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
	  # Validate filename
	  validates_attachment_file_name :cover, matches: [/png\Z/, /jpe?g\Z/]
	  # Validate size
	  validates_attachment_size :cover, :less_than => 5.megabytes
	  # Explicitly do not validate
	  do_not_validate_attachment_file_type :cover
	end
end