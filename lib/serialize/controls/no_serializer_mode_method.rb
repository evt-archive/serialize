module Serialize
  module Controls
    module NoModeMethod
      class Example
        module Serializer
          def self.some_serializer
            SomeSerializer
          end

          module SomeSerializer
            module Write
            end

            module Read
            end
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
