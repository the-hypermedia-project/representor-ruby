class Representor
  class RepresentorBuilder
    def initialize(representor_struct = nil)
      @internal_struct = representor_struct || RepresentorStruct.new
    end

    ##
    # Adds a meta link associated with the representor.
    #
    def add_meta_link(relation_type, uri)
      @internal_struct[:meta_links][relation_type] = { href: uri }
    end

    ##
    # Adds metadata associated with the representor.
    #
    def add_meta_data(name, value)
      @internal_struct[:meta_data][name, value]
    end

    ##
    # Adds a representor attribute.
    #
    def add_attribute(name, value)
      @internal_struct[:attributes][name] = value
    end

    ##
    # Adds a representor transition. Yields a transition builder for more complex transitions.
    #
    def add_transition(relation_type, uri, options = {}, &block)
      @internal_struct[:transitions][relation_type] = Transition.new(relation_type, uri, options, &block)
    end

    ##
    # Adds a representor transition as an element of an array transitions. Yields a transition builder for more
    # complex transitions.
    #
    def add_transitions(relation_type, uri, options = {}, &block)
      @internal_struct[:transtions][relation_type] ||= []
      @internal_struct[:transtions][relation_type] << add_transition(relation_type, uri, options, &block)
    end

    ##
    # Adds an embedded representor. Yields a representor builder.
    #
    def add_representor(name, &block)
      @internal_struct[:representors][name] = Representor.new(&block)
    end

    ##
    # Adds an embedded representor as an element of an array of representors. Yields a representor builder.
    #
    def add_representors(name, &block)
      @internal_struct[:representors][name] ||= []
      @internal_struct[:representors][name] << add_representor(name, &block)
    end

    ##
    # @return [Struct] The raw struct of the constructed for the representor.
    def to_struct
      @internal_struct.dup
    end

    ##
    # @return [Representor] A Hypermedia representor instance associated with the current state of the builder.
    def to_representor
      Representor.new(to_struct)
    end
  end
end

# @private
RepresentorStruct = Struct.new(:meta_links, :meta_data, :attibutes, :transitions, :representors) do

  def initialize
    self[:meta_links] = {}
    self[:meta_data] = {}
    self[:attibutes] = {}
    self[:transitions] = {}
    self[:representors] = {}
  end
end
