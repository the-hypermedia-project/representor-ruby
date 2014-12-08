require 'representor/transition_builder'

class Representor
  ##
  # A canonical transition for introspecting a state transition in a resource.
  class Transition
    attr_reader :relation_type, :uri, :title, :description

    def initialize(relation_type, uri, options = {})
      @relation_type, @uri = relation_type, uri
      @title = options[:title]
      @description = options[:description]

      @transition_builder = TransitionBuilder.new
      yield @transition_builder if block_given?
      @internal_struct = @transition_builder.to_struct
    end

    ##
    # The input attributes building a body to submit with the transition.
    #
    # @return [Hash of InputProperty]
    def attributes
      @attributes ||= @internal_struct[:attributes]
    end

    ##
    # The input query parameters for the transition URI.
    #
    # @return [Hash of InputProperty]
    def parameters
      @attributes ||= @internal_struct[:parameters]
    end
  end
end
