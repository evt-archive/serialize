module Serialize
  module Controls
    module NoModes
      class Example
        module Serializer
          module SomeSerializer
          end
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
