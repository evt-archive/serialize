module Serialize
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
end
