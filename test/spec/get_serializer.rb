require_relative 'spec_init'

describe 'Intermediate Form' do
  specify 'Can optionally be provided by the serializer' do
    example = Serialize::Controls.example

    serializer = Serialize::Write.serializer(example, :some_serializer)

    assert(serializer == Serialize::Controls::Example::Serializer::SomeSerializer)
  end
end
