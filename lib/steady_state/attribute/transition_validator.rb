module SteadyState
  module Attribute
    class TransitionValidator < ActiveModel::EachValidator
      def validate_each(obj, attr_name, value)
        return unless obj.instance_variable_defined?("@last_valid_#{attr_name}")

        obj.errors.add(attr_name, :invalid, from: obj.instance_variable_get("@last_valid_#{attr_name}"), to: value)
      end
    end
  end
end
