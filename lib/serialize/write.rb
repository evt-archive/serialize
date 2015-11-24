module Serialize
  module Write
    class Error < RuntimeError; end

    def self.call(subject, form)
      subject_cls = subject.class

      __logger.focus subject_cls.inspect

      assure_namespace(subject_cls)
      serializer_namespace = subject_cls.const_get(:Serializer)

      assure_form(form, serializer_namespace)
      serializer = serializer_namespace.send(form)

      assure_writer(serializer)
      serializer.write subject
    end

    def self.assure_namespace(subject_cls)
      unless subject_cls.const_defined?(:Serializer)
        raise Error, "#{subject_cls.name} doesn't have a `Serializer' namespace"
      end
    end

    def self.assure_form(form, serializer_namespace)
      unless serializer_namespace.respond_to?(form)
        raise Error, "#{serializer_namespace.name} does not implement `#{form}'"
      end
    end

    def self.assure_writer(serializer)
      unless serializer.respond_to?(:write)
        raise Error, "#{serializer.name} does not implement `write'"
      end
    end
  end
end
