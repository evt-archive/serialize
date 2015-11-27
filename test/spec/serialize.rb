require_relative 'spec_init'

describe 'Serializer' do
  specify 'Writes' do
    example = Serialize::Controls.example
    val = Serialize::Write.(example, :some_serializer)

    assert(val == 'some write')
  end
end
