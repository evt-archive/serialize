require_relative '../bench_init'

context "Class has no serializer namespace" do
  test "Implementation is not detected" do
    example = Serialize::Controls::NoSerializer.example

    implemented = Serialize::Read.implemented?(example, :some_format)

    assert(!implemented)
  end
end
