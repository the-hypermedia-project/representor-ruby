require File.expand_path('../../spec_helper.rb', __FILE__)

describe HypermediaResource::Transition::InputProperty do
  before do
    @input_property = HypermediaResource::Transition::InputProperty.new('name',
                                                                        :default => 'Default Name',
                                                                        :value => 'Kyle')
  end

  it 'has a name' do
    @input_property.name.should == 'name'
  end

  it 'has a value' do
    @input_property.value.should == 'Kyle'
  end

  it 'has a default' do
    @input_property.default.should == 'Default Name'
  end
end
