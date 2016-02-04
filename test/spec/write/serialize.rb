require_relative '../spec_init'

context "Serialize" do
  test "Converts an instance into text" do
    instance = Serialize::Controls.example
    text = Serialize::Write.(instance, :some_format)

    assert(text == Serialize::Controls::Text.example)
  end
end
