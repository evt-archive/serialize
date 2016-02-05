module Serialize
  module Write
    extend Serialize

    def self.call(instance, format_name)
      format = format(instance, format_name)

      raw_data = raw_data(instance)

      assure_mode(format, :serialize)
      format.serialize(raw_data)
    end

    def self.raw_data(instance)
      serializer = serializer(instance)
      assure_mode(serializer, :raw_data)
      serializer.raw_data(instance)
    end
  end
end
