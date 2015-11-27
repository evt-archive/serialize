require_relative 'spec_init'

describe "Get Raw Data from Serializer Before it's Converted" do
  specify "Ruby hash" do
    example = Serialize::Controls.example
    val = Serialize::Write.raw_data(example, :some_serializer)

    assert(val == 'some raw data')
  end
end
