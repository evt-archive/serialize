require_relative 'spec_init'

describe 'Deserializer' do
  specify 'Reads' do
    example_class = Serialize::Controls.example_class
    text = 'some text'
    val = Serialize::Read.(text, example_class, :some_serializer)

    assert(val == 'some read')
  end
end
