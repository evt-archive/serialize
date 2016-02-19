require_relative '../bench_init'

context "Class with write implementation" do
  test "Detected" do
    instance = Serialize::Controls::Instance.example

    implemented = Serialize::Write.implemented?(instance, :some_format)

    assert(implemented)
  end
end
