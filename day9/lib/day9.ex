defmodule GarbageStream do
  @moduledoc """
  Documentation for GarbageStream.
  """

  @doc """
  Hello world.

  ## Examples

      iex> GarbageStream.hello
      :world

  """
  def count_groups(input) do
    input
    |> IO.stream(1)
    |> Enum.reduce(0,fn(x,acc,ignore_one) -> processchar(x,acc,ignore_one) end)
  end

  def processchar("{", acc,_) do
    acc + 1
  end

  def processchar(_, acc, _) do
    acc
  end

  def processchar("!", acc, ignore_one) do
    ignore_one = true
    acc
  end

end
