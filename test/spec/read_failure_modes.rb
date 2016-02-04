__END__

require_relative 'spec_init'

context "Read Failure Modes" do
  scenarios = {
    'Serializer Namespace' => Serialize::Controls::NoSerializerNamespace,
    'Serializer Form Method' => Serialize::Controls::NoFormMethod,
    'Serializer Mode Namespace' => Serialize::Controls::NoModeNamespace,
    'Serializer Mode Method' => Serialize::Controls::NoModeMethod
  }

  scenarios.each do |descripton, control_namespace|
    context "Subject Has No #{descripton}" do
      example = control_namespace.example

      test "Is an error" do
        begin
          Serialize::Read.('some text', example, :some_serializer)
        rescue Serialize::Error => error
        end

        assert error
      end
    end
  end
end
