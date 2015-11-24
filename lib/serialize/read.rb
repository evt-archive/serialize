module Serialize
  module Read
    extend Serialize

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

    def self.assure_read(serializer)
      unless serializer.respond_to?(:read)
        raise Error, "#{serializer.name} does not implement `read'"
      end
    end
  end
end
