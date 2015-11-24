require_relative 'spec_init'

class Example
  module Serializer
    def self.some_serializer
      SomeSerializer
    end

    module SomeSerializer
      def self.read(text)
        'some read'
      end

      def self.write(obj)
        'some write'
      end
    end
  end
end

describe 'Serializer' do
  example = Example.new

  specify 'Writes' do
    example = Example.new
    val = Serialize::Write.(example, :some_serializer)

    assert(val == 'some write')
  end

  specify 'Reads' do
    example = Example.new
    val = Serialize::Read.(Example, :some_serializer)

    assert(val == 'some read')
  end
end
