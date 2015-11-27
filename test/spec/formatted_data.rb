require_relative 'spec_init'

describe "Get Formatted Data from Serializer Before it's Converted" do
  specify "Formatted hash" do
    example = Serialize::Controls.example
    raw_data = Serialize::Write.raw_data(example, :some_serializer)

    formatted_data = Serialize::Write.formatted_data(raw_data, example, :some_serializer)

    assert(formatted_data == 'some formatted data')
  end
end
