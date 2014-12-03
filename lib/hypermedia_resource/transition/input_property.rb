class HypermediaResource
  class Transition
    ##
    # Defines a property of a transition related to values that can be input when invoking a transition.
    #
    class InputProperty
      attr_reader :name, :default, :value, :validators

      def initialize(name, options = {})
        @name = name
        @default = options[:default]
        @validators = options[:validators]
        @value = options[:value]
      end
    end
  end
end
