require_relative '../spec_init'

describe "Raw Data" do
  specify "Can be converted in the final form from raw data" do
    raw_data = Serialize::Controls::RawData.example
    cls = Serialize::Controls.example_class
    control_example = Serialize::Controls.example

    example = Serialize::Read.instance(raw_data, cls)

    assert(example == control_example)
  end
end
