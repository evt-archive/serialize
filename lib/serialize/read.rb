module Serialize
  module Read
    extend Serialize

    def self.call(text, cls, form)
      serializer = serializer(cls, form)

      mode = :call
      assure_mode(serializer, mode)
      serializer.send mode, text
    end

    def self.mode_constant_name
      :Read
    end
  end
end
