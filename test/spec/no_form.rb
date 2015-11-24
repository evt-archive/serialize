require_relative 'spec_init'

describe 'Subject has No Form' do
  specify 'Writes' do
    example = Serialize::Controls::NoForm.example

    assert_raises Serialize::Error do
      Serialize::Write.(example, :some_serializer)
    end
  end

  specify 'Reads' do
    example = Serialize::Controls::NoForm.example_class

    assert_raises Serialize::Error do
      Serialize::Read.(example, :some_serializer)
    end
  end
end
