module Serialize
  module Controls
    class Example
      module Serializer
        def self.some_serializer
          SomeSerializer
        end

        module SomeSerializer
          module Write
            def self.call(obj)
              'some write'
            end

            def self.raw_data(subject)
              'some raw data'
            end

            def self.formatted_data(raw_data)
              'some formatted data'
            end
          end

          module Read
            def self.call(text)
              'some read'
            end

            def self.raw_data(subject)
              'some raw data'
            end

            def self.formatted_data(raw_data)
              'some formatted data'
            end
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
