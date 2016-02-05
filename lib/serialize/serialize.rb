module Serialize
  extend self

  class Error < RuntimeError; end

  def format(subject, format_name)
    serializer = serializer(subject)

    assure_format_method(format_name, serializer)
    serializer.send(format_name)
  end

  def serializer(subject)
    subject_const = subject_const(subject)

    assure_serializer_namespace(subject_const)
    subject_const.const_get(:Serializer)
  end

  def subject_const(subject)
    [Module, Class].include?(subject.class) ? subject : subject.class
  end

  def assure_serializer_namespace(subject_const)
    unless subject_const.const_defined?(:Serializer)
      raise Error, "#{subject_const.name} doesn't have a `Serializer' namespace"
    end
  end

  def assure_format_method(format_name, serializer)
    unless serializer.respond_to?(format_name)
      raise Error, "#{serializer.name} does not implement `#{format_name}'"
    end
  end

  def assure_mode(serializer, mode)
    unless serializer.respond_to?(mode)
      raise Error, "#{serializer.name} does not implement `#{mode}'"
    end
  end
end
