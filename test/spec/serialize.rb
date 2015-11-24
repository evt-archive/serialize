require_relative 'spec_init'

class Example
  module Serializerx
    def self.json
      JSON
    end

    module JSON
      def self.read(text)
      end

      def self.write(obj)
        'some output'
      end
    end
  end
end

describe 'Serialize' do
  specify do
    example = Example.new
    output = Serialize::Write.(example, :json)

    __logger.focus output

    # assert(output == 'some output')
  end
end
