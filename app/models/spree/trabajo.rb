module Spree
	class Trabajo < Spree::Base
		belongs_to :category
		has_many :pedidos
	  	has_many :materials
	end
end