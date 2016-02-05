module Serialize
  module Read
    extend Serialize

    def self.call(text, cls, format_name)
      format = format(cls, format_name)

      assure_mode(format, :deserialize)
      raw_data = format.deserialize text

      instance(raw_data, cls)
    end

    def self.instance(raw_data, cls)
      serializer = serializer(cls)
      assure_mode(serializer, :instance)
      serializer.instance(raw_data)
    end
  end
end
