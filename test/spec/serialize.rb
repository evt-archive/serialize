require_relative 'spec_init'

context 'Serializer' do
  test 'Writes' do
    example = Serialize::Controls.example
    val = Serialize::Write.(example, :some_serializer)

    assert(val == 'some write')
  end
end
