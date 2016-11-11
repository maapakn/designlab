module Spree
	class Dentist < Spree::Base
		has_many :pedidos, :dependent => :destroy
		belongs_to :user
	end
end