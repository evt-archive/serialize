require_relative '../spec_init'

context "Raw Data" do
  test "Can be retrieved from serializer before it's converted" do
    example = Serialize::Controls.example

    raw_data = Serialize::Write.raw_data(example)

    assert(raw_data == 'some raw data')
  end
end
