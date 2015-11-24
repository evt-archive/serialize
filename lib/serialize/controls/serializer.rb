module Serialize
  module Controls
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

    def self.example
      Example.new
    end

    def self.example_class
      Example
    end
  end
end
