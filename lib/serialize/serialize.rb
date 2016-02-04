module Serialize
  class Error < RuntimeError; end

  def serializer(subject, form)
    serializer_namespace = serializer_namespace(subject)

    assure_form_method(form, serializer_namespace)
    form_namespace = serializer_namespace.send(form)

    assure_mode_namespace(form_namespace)
    form_namespace.const_get(mode_constant_name)
  end

  def serializer_namespace(subject)
    subject_const = subject_const(subject)

    assure_serializer_namespace(subject_const)
    subject_const.const_get(:Serializer)
  end

  def formatted_data(raw_data, subject, form)
    serializer = serializer(subject, form)

    mode = :formatted_data
    assure_mode(serializer, mode)

    serializer.send mode, raw_data
  end

  def subject_const(subject)
    [Module, Class].include?(subject.class) ? subject : subject.class
  end

  def assure_serializer_namespace(subject_const)
    unless subject_const.const_defined?(:Serializer)
      raise Error, "#{subject_const.name} doesn't have a `Serializer' namespace"
    end
  end

  def assure_mode_namespace(form_namespace)
    unless form_namespace.const_defined?(mode_constant_name)
      raise Error, "#{form_namespace.name} doesn't have a `#{mode_constant_name}' namespace"
    end
  end

  def assure_form_method(form, serializer_namespace)
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
