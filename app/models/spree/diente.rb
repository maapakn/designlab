module Spree	
	class Diente < Spree::Base
	  has_many :pedidos_dientes
      has_many :pedidos, through: :pedidos_dientes
	  belongs_to :zona
	end
end