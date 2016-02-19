module Serialize
  module Read
    extend Serialize

    def self.mode
      :deserialize
    end

    def self.intermediate
      :instance
    end

    def self.call(text, cls, format_name)
      format = format(cls, format_name)

      assure_mode(format, mode)
      raw_data = format.deserialize text

      instance(raw_data, cls)
    end

    def self.instance(raw_data, cls)
      serializer = serializer(cls)
      assure_mode(serializer, intermediate)
      serializer.instance(raw_data)
    end

    def self.implemented?(subject, format_name)
      subject_const = subject_const(subject)

      unless serializer_const?(subject_const)
        return false
      end

      serializer = get_serializer(subject_const)

      unless mode?(serializer, intermediate)
        return false
      end      

      unless format?(format_name, serializer)
        return false
      end

      format = get_format(format_name, serializer)

      unless mode?(format, mode)
        return false
      end

      true
    end
  end
end
