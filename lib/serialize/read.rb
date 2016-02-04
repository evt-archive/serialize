module Serialize
  module Read
    extend Serialize

    def self.call(text, cls, form)
      serializer = serializer(cls, form)

      mode = :call
      assure_mode(serializer, mode)
      serializer.send mode, text
    end

    def self.raw_data(raw_data, cls, form)
      serializer = serializer(raw_data, form)

      mode = :raw_data
      assure_mode(serializer, mode)

      serializer.send mode, raw_data
    end

    def self.mode_constant_name
      :Read
    end
  end
end
