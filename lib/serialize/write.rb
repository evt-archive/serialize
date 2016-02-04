module Serialize
  module Write
    extend Serialize

    def self.call(subject, form)
      serializer = serializer(subject, form)

      mode = :call
      assure_mode(serializer, mode)
      serializer.send mode, subject
    end

    def self.mode_constant_name
      :Write
    end
  end
end
