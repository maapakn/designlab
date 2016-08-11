module Spree 
  class Material < Spree::Base
  	has_many :pedidos
    belongs_to :trabajo
  end
end