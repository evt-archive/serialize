require_relative '../bench_init'

context "Class with read implementation" do
  test "Detected" do
    instance = Serialize::Controls::Instance.example

    implemented = Serialize::Read.implemented?(instance, :some_format)

    assert(implemented)
  end
end
