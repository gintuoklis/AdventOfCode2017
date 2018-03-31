defmodule CAPTCHA do
  @moduledoc """
  Documentation for CAPTCHA.
  """

  @doc """
  Hello world.

  ## Examples

      iex> CAPTCHA.hello
      :world

  """
  def solve(input) do
    graphemes = String.graphemes(input)

    Stream.chunk_every(graphemes, 2, 1, [Enum.at(graphemes, 0)])
    |> Enum.reduce(0, fn [a, b], acc -> if(a == b, do: acc + String.to_integer(a), else: acc) end)
  end

  def solve2(input) do
    listA = String.graphemes(input)
    count = Enum.count(listA)
    listB = listA |> Stream.cycle() |> Enum.slice(div(count, 2), count)

    Stream.zip(listA, listB)
    |> Enum.reduce(0, fn {a, b}, acc -> if(a == b, do: acc + String.to_integer(a), else: acc) end)
  end
end
