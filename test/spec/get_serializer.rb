require_relative 'spec_init'

describe "Serializer" do
  [:Write, :Read].each do |constant_name|
    specify "Can be retrieved from the subject" do
      example = Serialize::Controls.example

      serializer_class = Serialize.const_get(constant_name)
      serializer = serializer_class.serializer(example, :some_serializer)

      assert(serializer == Serialize::Controls::Example::Serializer::SomeSerializer.const_get(constant_name))
    end
  end
end
