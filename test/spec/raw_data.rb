require_relative 'spec_init'

context "Raw Data" do
  [:Write, :Read].each do |constant_name|
    test "Can be retrieved from serializer before it's converted" do
      example = Serialize::Controls.example

      serializer_class = Serialize.const_get(constant_name)
      raw_data = serializer_class.raw_data(example, :some_serializer)

      assert(raw_data == 'some raw data')
    end
  end
end
