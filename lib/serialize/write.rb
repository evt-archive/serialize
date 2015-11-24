module Serialize
  module Write
    extend Serialize

    class Error < RuntimeError; end

    def self.call(subject, form)
      subject_const = subject_const(subject)

      assure_namespace(subject_const)
      serializer_namespace = subject_const.const_get(:Serializer)

      assure_form(form, serializer_namespace)
      serializer = serializer_namespace.send(form)

      assure_write(serializer)
      serializer.write subject
    end

    def self.assure_write(serializer)
      unless serializer.respond_to?(:write)
        raise Error, "#{serializer.name} does not implement `write'"
      end
    end
  end
end
