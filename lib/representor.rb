require 'representor/representor_builder'

##
# A canonical interface for introspecting a hypermedia message. A builder is used to construct the object
# to keep the interface of instances simple and abstract the internal complexity that supports diverse
# generic hypermedia media types.
#
# @example
#   representor = Representor.new do |builder|
#     builder.add_meta_link(:profile, 'http://alps.io/schema.org/ItemList')
#
#     builder.add_transition(:self, 'http://example.com/something')
#
#     builder.add_transition(:search, 'http://example.com/search') do |transition_builder|
#       transition_builder.add_parameter(:name)
#     end
#
#     builder.add_transition(:create, 'http://example.com/some_resources') do |transition_builder|
#       transition_builder.add_attribute(:first_name, { validators: [required: true] })
#       transition_builder.add_attribute(:last_name, { validators: [required: true] })
#     end
#
#     builder.add_attribute(:about, 'A list of people.')
#
#     builder.add_representors(:people) do |representor_builder|
#       representor_builder.add_transition(:self, 'http://example.com/person/1')
#       representor_builder.add_attribute(:first_name, '')
#       representor_builder.add_attribute(:last_name, '')
#     end
#
#     builder.add_representors(:people) do |representor_builder|
#       representor_builder.add_attribute(:first_name, '')
#       representorbuilder.add_attribute(:last_name, '')
#       representor_builder.add_transition(:self, 'http://example.com/person/2')
#     end
#   end
#
#   self_transition = representor.transitions[:self]
#   self_transition.uri # => 'http://example.com/something'
#
#   search_transition = representor.transitions[:search]
#   search_transition.parameters.keys # => [:name]
#
#   create_transition = representor.transitions[:create]
#   create_transition.attributes.keys # => [:first_name, :last_name]
#
#   representor.attributes[:total_count] # => 2
#
#   people = representor.representors[:people]
#   person = people.first
#   person.first_name # =>
#
class Representor
  def initialize(representor_struct = nil)
    builder = RepresentorBuilder.new(representor_struct)
    yield builder if block_given?
    @internal_struct = builder.to_struct
  end

  ##
  # Any meta links, e.g. profile, type.
  #
  def meta_links
    @meta_links ||= @internal_struct[:meta_links]
  end

  ##
  # Any meta data about the representor.
  #
  def meta_data
    @meta_data ||= @internal_struct[:meta_data]
  end

  ##
  # The attributes of the representor.
  #
  def attributes
    @attributes ||= @internal_struct[:attributes] || {}
  end

  ##
  # The transitions available for the representor.
  #
  # @return [Hash] The transition keyed by relation type.
  def transitions
    @transitions ||= @internal_struct[:transitions] || {}
  end

  ##
  # The separate representors embedded in the current representor.
  #
  # @return [Hash of Representor] Any embedded representors keyed by name.
  def representors
    @representors ||= @internal_struct[:representors] || {}
  end
end
