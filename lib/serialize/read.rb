module Serialize
  module Read
    extend Serialize

    def self.call(text, cls, format_name)
      format = format(cls, format_name)

      mode = :deserialize

      assure_mode(format, mode)
      raw_data = format.send mode, text

      instance(raw_data, cls)
    end

    def self.instance(raw_data, cls)
      serializer = serializer(cls)
      serializer.instance(raw_data)
    end
  end
end
