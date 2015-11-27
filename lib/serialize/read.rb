module Serialize
  module Read
    extend Serialize

    def self.call(text, cls, form)
      serializer = serializer(cls, form)

      assure_mode(serializer, mode)
      serializer.send mode, text
    end

    def self.mode
      :read
    end
  end
end
