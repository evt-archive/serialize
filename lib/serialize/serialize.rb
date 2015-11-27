module Serialize
  class Error < RuntimeError; end

  def call(subject, form, mode: nil)
    mode ||= self.mode

    subject_const = subject_const(subject)

    assure_namespace(subject_const)
    serializer_namespace = subject_const.const_get(:Serializer)

    assure_form(form, serializer_namespace)
    serializer = serializer_namespace.send(form)

    assure_mode(serializer, mode)

    serializer.send mode, subject
  end

  def subject_const(subject)
    [Module, Class].include?(subject.class) ? subject : subject.class
  end

  def assure_namespace(subject_const)
    unless subject_const.const_defined?(:Serializer)
      raise Error, "#{subject_const.name} doesn't have a `Serializer' namespace"
    end
  end

  def assure_form(form, serializer_namespace)
    unless serializer_namespace.respond_to?(form)
      raise Error, "#{serializer_namespace.name} does not implement `#{form}'"
    end
  end

  def assure_mode(serializer, mode)
    unless serializer.respond_to?(mode)
      raise Error, "#{serializer.name} does not implement `#{mode}'"
    end
  end
end
