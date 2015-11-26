require_relative 'spec_init'

describe 'Intermediate Form' do
  specify 'Can optionally be provided by the serializer' do
    example = Serialize::Controls.example
    val = Serialize::Write.(example, :some_serializer, intermediate: true)

    assert(val == 'some intermediate data')
  end
end
