require 'representor/transition/input_property'

class Representor
  class TransitionBuilder
    def initialize(transition_struct = nil)
      @internal_struct = transition_struct || TransitionStruct.new
    end

    ##
    # Add a body attribute definition to the transition
    def add_attribute(name, options = {})
      add_property(:attributes, name, options)
    end

    ##
    # Add a query parameter definition to the transtion
    def add_parameter(name, options = {})
      add_property(:parameters, name, options)
    end

    ##
    # Return a built struct object from the builder.
    def to_struct
      @internal_struct.dup
    end

    ##
    # Return a built transition from the builder.
    def to_transition
      Transition.new(to_struct)
    end

    private

    def add_property(type, name, options)
      @internal_struct[type][name] = InputProperty.new(name, options)
    end
  end
end

# @private
TransitionStruct = Struct.new(:attributes, :parameters) do

  def initialize
    self[:attributes] = {}
    self[:parameters] = {}
  end
end
