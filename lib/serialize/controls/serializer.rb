module Serialize
  module Controls
    class Example
      attr_accessor :some_attribute

      def ==(other)
        other.some_attribute == self.some_attribute
      end

      module Serializer
        def self.some_serializer
          SomeSerializer
        end

        ## instance
        def self.read(raw_data)
          instance = Example.new
          instance.some_attribute = raw_data
          instance
        end

        ## raw_data
        def self.write(instance)
          instance.some_attribute
        end

        module SomeSerializer
          module Write
            def self.call(obj)
              'some write'
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
              Controls::RawData.example
            end

            def self.formatted_data(raw_data)
              'some formatted data'
            end
          end
        end
      end
    end

    def self.example
      instance = Example.new
      instance.some_attribute = Controls::RawData.example
      instance
    end

    def self.example_class
      Example
    end
  end
end
