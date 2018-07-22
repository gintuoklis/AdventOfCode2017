defmodule Memory do
  @moduledoc """
  Documentation for Memory.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Memory.hello
      :world

  """
  def reallocate_loop(_, acc, _, true) do
    acc
  end

  def reallocate_loop(list, acc, mapset, false) do
    new_list = reallocate(list)
    reallocate_loop(new_list, acc + 1, MapSet.put(mapset, new_list), MapSet.member?(mapset, new_list))
  end

  def reallocate_loop2(list, _, mapset, true) do
    length(mapset) - Enum.find_index(mapset, &(&1==list)) -1
  end

  def reallocate_loop2(list, acc, mapset, false) do
    new_list = reallocate(list)
    reallocate_loop2(new_list, acc + 1, mapset ++ [new_list], Enum.member?(mapset, new_list))
  end

  def reallocate(list) do
    max = Enum.max(list)
    index = Enum.find_index(list,&(&1==max))
    list = List.update_at(list,index,&(&1-&1))
    distribute(list, index + 1, max)
  end

  def distribute(list,_,0) do
    list
  end

  def distribute(list,index,blocks_to_distribute) do
    true_index = Integer.mod(index, length(list))
    List.update_at(list,true_index,&(&1+1)) |>
    distribute(true_index+1,blocks_to_distribute-1)
  end
end
