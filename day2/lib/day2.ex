defmodule Corruption do
  @moduledoc """
  Documentation for Corruption.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Corruption.hello
      :world

  """
  def hello do
    :world
  end

#part1
  def checksumPerLine(input) do
    numbers = String.split(input)|>Enum.map(fn x -> String.to_integer(x)end)
    Enum.max(numbers)-Enum.min(numbers)
  end

  def checksum(input) do
    lines = String.split(input, "\n")
    Enum.map(lines, fn x -> checksumPerLine(x) end)|> Enum.sum()
  end

#part2
#my take on this algorithm, next time rewrite it with for loops, instead of reduce. less complicated to test all scenarios.
#on the other hand, reduce_while should be more effective.
  def checksumPerLine2(input) do
    numbers = String.split(input)|>Enum.map(fn x -> String.to_integer(x)end)
    numbers |>
      Enum.reduce(0,fn(x,acc) ->
         acc + Enum.reduce(numbers,0, fn(y,acc2)-> if (y != x && rem(x,y) == 0), do: acc2 + div(x,y), else: acc2 end) end)
  end

  def checksum2(input) do
    lines = String.split(input, "\n")
    Enum.map(lines, fn x -> checksumPerLine2(x) end)|> Enum.sum()
  end
end


 #Enum.reduce_while([5,9,2,8], 0,fn(x) -> IO.puts(x) end)
#Enum.reduce_while([5,9,2,8],0,fn(x,acc)-> Enum.each([5,9,2,8],fn(y)->x/y end)  do: {:cont, IO.puts(x)}, else: {:halt} end)
# numbers |>
# Enum.reduce_while(0,
#      fn(x,acc)-> Enum.each(numbers,
#                            fn(y)-> if(y != x && rem(x,y) == 0, do: {:halt, acc + div(x,y)})
#                            end),
#     end)
# #
#
# numbers |> Enum.reduce(fn(x,acc1)-> Enum.reduce(numbers, fn(y,acc2)-> if(y != x && rem(x,y) == 0, do: acc2+ div(x,y)) end) end)
#
# numbers |> Enum.reduce(fn(x,acc1)-> Enum.reduce(numbers, fn(y,acc2)-> if(y != x && rem(x,y) == 0, do: IO.inspect(div(x,y))) end) end)
#
# numbers |> Enum.reduce(0,fn(x,acc)-> Enum.reduce(numbers,0, fn(y,acc)-> if(y != x && rem(x,y) == 0, do: acc + 1) end) end)
# numbers |> Enum.reduce(0,fn(x,acc)-> Enum.reduce(numbers,0, fn(y,acc)-> if (y != x && rem(x,y) == 0), do: IO.inspect(div(x,y)), else: acc end) end)
