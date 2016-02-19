module Serialize
  module Write
    extend Serialize

    def self.mode
      :serialize
    end

    def self.intermediate
      :raw_data
    end

    def self.call(instance, format_name)
      format = format(instance, format_name)

      raw_data = raw_data(instance)

      assure_mode(format, mode)
      format.serialize(raw_data)
    end

    def self.raw_data(instance)
      serializer = serializer(instance)
      assure_mode(serializer, intermediate)
      serializer.raw_data(instance)
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
