defmodule SpiralTest do
  use ExUnit.Case


  test "greets the world" do
    assert Spiral.hello() == :world
  end

  test "x coordinates1" do
    assert  Spiral.getxcoordinates(1) == 0
  end
  test "x coordinates2" do
    assert  Spiral.getxcoordinates(2) == 1
  end
  test "x coordinates3" do
    assert  Spiral.getxcoordinates(3) == 1
  end
  test "x coordinates4" do
    assert  Spiral.getxcoordinates(4) == 0
  end
  test "x coordinates5" do
    assert  Spiral.getxcoordinates(5) == -1
  end
  test "x coordinates6" do
    assert  Spiral.getxcoordinates(6) == -1
  end
  test "x coordinates7" do
    assert  Spiral.getxcoordinates(7) == -1
  end
  test "x coordinates8" do
    assert  Spiral.getxcoordinates(8) == 0
  end


  test "y coordinates1" do
    assert  Spiral.getycoordinates(1) == 0
  end
  test "y coordinates2" do
    assert  Spiral.getycoordinates(2) == 0
  end
  test "y coordinates3" do
    assert  Spiral.getycoordinates(3) == 1
  end
  test "y coordinates4" do
    assert  Spiral.getycoordinates(4) == 1
  end
  test "y coordinates5" do
    assert  Spiral.getycoordinates(5) == 1
  end
  test "y coordinates6" do
    assert  Spiral.getycoordinates(6) == 0
  end
  test "y coordinates7" do
    assert  Spiral.getycoordinates(7) == -1
  end
  test "y coordinates8" do
    assert  Spiral.getycoordinates(8) == -1
  end

  # test "x coordinates 289326" do
  #   assert  Spiral.getxcoordinates(289326) == -150
  # end
  # test "y coordinates 289326" do
  #   assert  Spiral.getycoordinates(289326) == 269
  # end
  #
  # test "distance to  289326" do
  #   assert  Spiral.getdistance(289326) == 419
  # end

  test "distance to  12" do
    assert  Spiral.getdistance(12) == 3
  end

  test "distance to  23" do
      assert  Spiral.getdistance(23) == 2
    end

  test "distance to  1024" do
        assert  Spiral.getdistance(1024) == 31
  end

  test "sum neighbors 1" do
    assert  Spiral.sumneighbors({1,1}, %{{0,0}=>1,{0,1}=>1}) == 2
  end

  test "sum neighbors 2" do
    assert  Spiral.sumneighbors({-1,1}, %{{0,0}=>1,{1,0}=>1, {1,1}=>2, {0,1}=>4}) == 5
  end

  test "walkt the path" do
    assert Spiral.walkthepath(289326) == "test"
  end
end
