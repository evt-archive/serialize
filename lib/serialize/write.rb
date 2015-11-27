module Serialize
  module Write
    extend Serialize

    def self.call(subject, form)
      serializer = serializer(subject, form)

      assure_mode(serializer, mode)
      serializer.send mode, subject
    end

    def self.mode
      :write
    end
  end
end
