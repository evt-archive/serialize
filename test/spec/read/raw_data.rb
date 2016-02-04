require_relative '../spec_init'

context "Raw Data" do
  test "Convert raw data into an instance" do
    raw_data = Serialize::Controls::RawData.example
    cls = Serialize::Controls.example_class
    control_example = Serialize::Controls.example

    example = Serialize::Read.instance(raw_data, cls)

    assert(example == control_example)
  end
end
