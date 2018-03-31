defmodule Passphrases do
  @moduledoc """
  Documentation for Passphrases.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Passphrases.hello
      :world

  """
  @alphabet %{"a"=>2, "b"=>3, "c"=>5, "d"=>7, "e"=>11,
    "f"=>13, "g"=>13, "h"=>17, "i"=>19, "j"=>23,
    "k"=>29, "l"=>31, "m"=>37, "n"=>41, "o"=>43,
    "p"=>47, "q"=>53, "r"=>59, "s"=>61, "t"=>67,
    "u"=>71, "v"=>73, "w"=>79, "x"=>83, "y"=>89,
    "z"=>97}

  def validate(line) do
    words = String.split(line, " ")
    if (words |> Enum.count) == (words|>Stream.uniq|>Enum.count) do
      :valid
    else
      :invalid
    end
  end

  def validate2(line) do
    words = String.split(line, " ")
    if (words |> Enum.count) == (words|> Enum.map(fn(x)-> encode_phrase(x) end)|>Enum.uniq|>Enum.count) do
      :valid
    else
      :invalid
    end
  end

  def encode_phrase(phrase) do
    Enum.reduce(String.graphemes(phrase), 1, fn(x,acc) -> Map.get(@alphabet,x)*acc end)
  end

  def count_valid_phrases(input) do
     lines = String.split(input, "\n")
     Enum.count(lines, fn x -> validate(x)==:valid end)
  end

  def count_valid_phrases2(input) do
     lines = String.split(input, "\n")
     Enum.count(lines, fn x -> validate2(x)==:valid end)
  end
end
