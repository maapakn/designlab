module Spree 
  class Material < Spree::Base
  	has_many :pedidos
    belongs_to :trabajo

    validates_presence_of :nombre
    validates_presence_of :precio
    validates_presence_of :price
    validates_presence_of :trabajo
  end
end