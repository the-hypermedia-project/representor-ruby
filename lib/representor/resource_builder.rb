class Representor
  class ResourceBuilder
    def initialize(resource_struct = nil)
      @internal_struct = resource_struct || ResourceStruct.new
    end

    ##
    # Adds a meta link associated with the resource.
    #
    def add_meta_link(relation_type, uri)
      @internal_struct[:meta_links][relation_type] = { href: uri }
    end

    ##
    # Adds metadata associated with the resource.
    #
    def add_meta_data(name, value)
      @internal_struct[:meta_data][name, value]
    end

    ##
    # Adds a resource attribute.
    #
    def add_attribute(name, value)
      @internal_struct[:attributes][name] = value
    end

    ##
    # Adds a resource transition. Yields a transition builder for more complex transitions.
    #
    def add_transition(relation_type, uri, options = {}, &block)
      @internal_struct[:transitions][relation_type] = Transition.new(relation_type, uri, options, &block)
    end

    ##
    # Adds a resource transition as an element of an array transitions. Yields a transition builder for more
    # complex transitions.
    #
    def add_transitions(relation_type, uri, options = {}, &block)
      @internal_struct[:transtions][relation_type] ||= []
      @internal_struct[:transtions][relation_type] << add_transition(relation_type, uri, options, &block)
    end

    ##
    # Adds an embedded resource. Yields a resource builder.
    #
    def add_resource(name, &block)
      @internal_struct[:resources][name] = Representor.new(&block)
    end

    ##
    # Adds an embedded resource as an element of an array of resources. Yields a resource builder.
    #
    def add_resources(name, &block)
      @internal_struct[:resources][name] ||= []
      @internal_struct[:resources][name] << add_resource(name, &block)
    end

    ##
    # @return [Struct] The raw struct of the constructed for the resource.
    def to_struct
      @internal_struct.dup
    end

    ##
    # @return [Representor] A Hypermedia resource instance associated with the current state of the builder.
    def to_resource
      Representor.new(to_struct)
    end
  end
end

# @private
ResourceStruct = Struct.new(:meta_links, :meta_data, :attibutes, :transitions, :resources) do

  def initialize
    self[:meta_links] = {}
    self[:meta_data] = {}
    self[:attibutes] = {}
    self[:transitions] = {}
    self[:resources] = {}
  end
end
