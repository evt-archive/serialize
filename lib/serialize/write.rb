module Serialize
  module Write
    extend Serialize

    def self.call(subject, form)
      serializer = serializer(subject, form)

      mode = :call
      assure_mode(serializer, mode)
      raw_data = self.raw_data(subject)
      serializer.send mode, subject


      ## raw_data = serializer.raw_data(instance)
      # raw_data = self.raw_data(subject)

      # formatted_data = serializer.formatted_data(raw_data)

      # json_text = JSON.generate(formatted_data)
      # json_text
    end

    def self.raw_data(instance)
      serializer_namespace = serializer_namespace(instance)
      serializer_namespace.raw_data(instance)
    end

    def self.mode_constant_name
      :Write
    end
  end
end
