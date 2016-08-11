Spree::Api::ApiHelpers.class_eval do
  class_variable_set(:@@user_attributes, class_variable_get(:@@user_attributes).push(:nombre))
end