module Serialize
  module Controls
    module NoForm
      class Example
        module Serializer
        end
      end

      def self.example
        Example.new
      end

      def self.example_class
        Example
      end
    end
  end
end
