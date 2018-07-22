defmodule Registers do
  @moduledoc """
  Documentation for Registers.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Registers.hello
      :world

  """


  def processfile(input) do
    lines = String.split(input, "\n")
    registry = Enum.reduce(lines, %{}, fn(x, registry) ->
                              [key, operation, inc_by, _, cond_key, cond_operation, cond_inc_by] = String.split(x, " ")
                              inc_by_int = String.to_integer(inc_by)
                              cond_inc_by_int = String.to_integer(cond_inc_by)
                              registry = Map.put_new(registry, key, 0)
                              registry = Map.put_new(registry, cond_key, 0)

                              if perform_operation?(cond_operation, registry, cond_key, cond_inc_by_int) do
                                perform_operation(operation, registry, key, inc_by_int)
                              else
                                registry
                              end
                            end
                            )
      registry |> Map.values |> Enum.max
  end
  def perform_operation?(">", registry, key, value) do
    Map.get(registry, key, 0) > value
  end
  def perform_operation?("<", registry, key, value) do
    Map.get(registry, key, 0) < value
  end
  def perform_operation?(">=", registry, key, value) do
    Map.get(registry, key, 0) >= value
  end
  def perform_operation?("<=", registry, key, value) do
    Map.get(registry, key, 0) <= value
  end
  def perform_operation?("==", registry, key, value) do
    Map.get(registry, key, 0) == value
  end
  def perform_operation?("!=", registry, key, value) do
    Map.get(registry, key, 0) != value
  end
  def perform_operation("inc", registry, key, value) do
    Map.update(registry, key, 0, &(&1 + value))
  end
  def perform_operation("dec", registry, key, value) do
    Map.update(registry, key, 0, &(&1 - value))
  end
end
