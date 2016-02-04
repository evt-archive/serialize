require_relative '../spec_init'

context "Deserialize" do
  test "Converts text into an instance" do
    text = Serialize::Controls::Text.example

    example = Serialize::Controls.example
    example_class = example.class

    instance = Serialize::Read.(text, example_class, :some_format)

    assert(instance == example)
  end
end
