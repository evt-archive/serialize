require_relative 'spec_init'

context "Formatted Data" do
  [:Write, :Read].each do |constant_name|
    test "Can be retrieved from serializer before it's converted" do
      example = Serialize::Controls.example

      serializer_class = Serialize.const_get(constant_name)

      raw_data = 'some raw data'
      formatted_data = serializer_class.formatted_data(raw_data, example, :some_serializer)

      assert(formatted_data == 'some formatted data')
    end
  end
end
