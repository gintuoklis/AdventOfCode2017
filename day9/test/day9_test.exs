defmodule GarbageStreamTest do
  use ExUnit.Case
  doctest GarbageStream

  test "counting example {}" do
    assert GarbageStream.count_groups("{}") == 1
  end

  test "counting example {{{}}}" do
    assert GarbageStream.count_groups("{{{}}}") == 3
  end

  test "counting example {{},{}}" do
    assert GarbageStream.count_groups("{{},{}}") == 3
  end

  test "counting example 4" do
    assert GarbageStream.count_groups("{{{},{},{{}}}}") == 6
  end

  test "counting example 5" do
    assert GarbageStream.count_groups("{<{},{},{{}}>}") == 1
  end

  test "counting example 6" do
    assert GarbageStream.count_groups("{<a>,<a>,<a>,<a>}") == 1
  end
  test "counting example 7" do
    assert GarbageStream.count_groups("{{<a>},{<a>},{<a>},{<a>}}") == 5
  end
  test "counting example 8" do
    assert GarbageStream.count_groups("{{<!>},{<!>},{<!>},{<a>}}") == 2
  end

end
