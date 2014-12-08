require 'spec_helper'
require 'representor/transition/input_property'

class Representor
  class Transition
    RSpec.describe InputProperty do
      let(:subject) { InputProperty.new('name', default: 'Default Name', value: 'Kyle') }

      describe '#name' do
        it 'returns a property name' do
          expect(subject.name).to eql('name')
        end
      end

      describe '#default' do
        it 'returns a property name' do
          expect(subject.default).to eql('Default Name')
        end
      end

      describe '#value' do
        it 'returns a property value' do
          expect(subject.value).to eql('Kyle')
        end
      end
    end
  end
end
