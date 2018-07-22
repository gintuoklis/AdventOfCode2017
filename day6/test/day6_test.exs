defmodule MemoryTest do
  use ExUnit.Case

  test "test 1" do
    assert Memory.reallocate([0,2,7,0]) == [2,4,1,2]
  end
  test "test 2" do
    assert Memory.reallocate([2,4,1,2]) == [3,1,2,3]
  end
  test "test 3" do
    assert Memory.reallocate([3,1,2,3]) == [0,2,3,4]
  end
  test "test 4" do
    assert Memory.reallocate([0,2,3,4]) == [1,3,4,1]
  end
  test "test 5" do
    assert Memory.reallocate([1,3,4,1]) == [2,4,1,2]
  end

  test "test 6" do
    assert Memory.reallocate_loop([0,2,7,0], 0, %MapSet{}, false) == 5
  end

  test "test 7" do
    assert Memory.reallocate_loop([5,1,10,0,1,7,13,14,3,12,8,10,7,12,0,6], 0, %MapSet{}, false) == 5042
  end

  test "test 8" do
    assert Memory.reallocate_loop2([0,2,7,0], 0, [], false) == 4
  end
  test "test 9" do
    assert Memory.reallocate_loop2([5,1,10,0,1,7,13,14,3,12,8,10,7,12,0,6], 0, [], false) == 1086
  end
end
