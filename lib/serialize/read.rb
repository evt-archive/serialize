module Serialize
  module Read
    class Error < RuntimeError; end

    def self.call(subject, form)
      subject_const = subject_const(subject)

      assure_namespace(subject_const)
      serializer_namespace = subject_const.const_get(:Serializer)

      assure_form(form, serializer_namespace)
      serializer = serializer_namespace.send(form)

      assure_read(serializer)
      serializer.read subject
    end

    def self.subject_const(subject)
      [Module, Class].include?(subject.class) ? subject : subject.class
    end

    def self.assure_namespace(subject_const)
      unless subject_const.const_defined?(:Serializer)
        raise Error, "#{subject_const.name} doesn't have a `Serializer' namespace"
      end
    end

    def self.assure_form(form, serializer_namespace)
      unless serializer_namespace.respond_to?(form)
        raise Error, "#{serializer_namespace.name} does not implement `#{form}'"
      end
    end

    def self.assure_read(serializer)
      unless serializer.respond_to?(:read)
        raise Error, "#{serializer.name} does not implement `read'"
      end
    end
  end
end
