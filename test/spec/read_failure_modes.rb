require_relative 'spec_init'

describe "Read Failure Modes" do
  scenarios = {
    'Serializer Namespace' => Serialize::Controls::NoSerializerNamespace,
    'Serializer Form Method' => Serialize::Controls::NoFormMethod,
    'Serializer Mode Namespace' => Serialize::Controls::NoModeNamespace,
    'Serializer Mode Method' => Serialize::Controls::NoModeMethod
  }

  scenarios.each do |descripton, control_namespace|
    describe "Subject Has No #{descripton}" do
      example = control_namespace.example

      specify "Is an error" do
        assert_raises Serialize::Error do
          Serialize::Read.('some text', example, :some_serializer)
        end
      end
    end
  end
end
