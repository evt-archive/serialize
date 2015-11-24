require_relative 'spec_init'

describe "Failure Modes" do
  scenarios = {
    'Serializer Namespace' => Serialize::Controls::NoSerializerNamespace,
    'Serializer Form Method' => Serialize::Controls::NoForm,
    'Serializer Mode Methods' => Serialize::Controls::NoModes
  }

  scenarios.each do |descripton, control_namespace|

    describe "Subject Has No #{descripton}" do
      context "Writing" do
        example = Serialize::Controls::NoSerializerNamespace.example

        specify "Is an error" do
          assert_raises Serialize::Error do
            Serialize::Write.(example, :some_serializer)
          end
        end
      end

      context "Reading" do
        example = Serialize::Controls::NoSerializerNamespace.example_class

        specify "Is an error" do
          assert_raises Serialize::Error do
            Serialize::Read.(example, :some_serializer)
          end
        end
      end
    end
  end
end
