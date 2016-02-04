require_relative '../spec_init'

describe "Raw Data" do
  specify "Can be retrieved from serializer before it's converted" do
    example = Serialize::Controls.example

    raw_data = Serialize::Write.raw_data(example, :some_serializer)

    assert(raw_data == 'some raw data')
  end
end
