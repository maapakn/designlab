module Spree	
	class Diente < Spree::Base
	  has_many :pedidos
	  belongs_to :zona
	end
end