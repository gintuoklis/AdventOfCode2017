defmodule Spiral do
  @moduledoc """
  Documentation for Spiral.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Spiral.hello
      :world

  """
  def hello do
    :world
  end

  def getxcoordinates(1) do
    0
  end

  def getxcoordinates(n) do
     getxcoordinates(n-1) + round(
                              :math.sin(
                               rem( round(Float.floor(:math.sqrt(4*(n-2)+1))) ,4)
                              *
                               :math.pi/2))
  end

  def getycoordinates(1) do
    0
  end

  def getycoordinates(n) do
    getycoordinates(n-1) - round(
                             :math.cos(
                              rem( round(Float.floor(:math.sqrt(4*(n-2)+1))) ,4)
                             *
                              :math.pi/2))
  end

  def getdistance(n) do
    abs(getxcoordinates(n)) + abs(getycoordinates(n))
  end

  def sumneighbors({x,y}, points) do
    Map.get(points,{x-1,y+1},0) +
    Map.get(points,{x-1,y},0) +
    Map.get(points,{x-1,y-1},0) +
    Map.get(points,{x,y+1},0) +
    Map.get(points,{x,y-1},0) +
    Map.get(points,{x+1,y+1},0) +
    Map.get(points,{x+1,y}, 0) +
    Map.get(points,{x+1,y-1}, 0)
  end



  # def walkthepath(n,value, maxsum, _) when value >= maxsum or n > 10 do
  #   IO.puts "reached the end #{value}"
  # end
  #
  # def walkthepath(0,0, maxsum, points) do
  #   addtopoints({0,0},1,points)
  #   #IO.inspect(points)
  #
  #   walkthepath(1,1, maxsum, points)
  # end

  def walkthepath(maxsum) do
    Stream.iterate(2, &(&1+1)) |>
      Enum.reduce_while(%{{0,0}=>1}, fn(x,points) -> if Enum.max(Map.values(points)) < maxsum, do: {:cont, calculatePoint(x,points)}, else: {:halt, IO.inspect(Enum.max(Map.values(points)))}  end)

    #IO.puts "point #{x} #{y} #{newvalue}"
  end

  def calculatePoint(n, points) do
    #IO.inspect(n)

    x = getxcoordinates(n)
    y = getycoordinates(n)
    newvalue = sumneighbors({x,y},points)

    Map.put(points, {x,y}, newvalue)


  end

end
