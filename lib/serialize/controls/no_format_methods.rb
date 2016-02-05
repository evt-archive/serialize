module Serialize
  module Controls
    module NoFormatMethods
      class Example
        module Serializer
          def self.some_format
            SomeFormat
          end

          module SomeFormat
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
