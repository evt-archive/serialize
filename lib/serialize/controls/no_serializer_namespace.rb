module Serialize
  module Controls
    module NoSerializerNamespace
      class Example
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
