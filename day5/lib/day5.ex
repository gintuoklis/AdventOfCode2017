defmodule Maze do
  @moduledoc """
  Documentation for Maze.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Maze.hello
      :world

  """
  def takestep(list, curr_pos) do
    step = Enum.at(list, curr_pos)
    List.replace_at(list,curr_pos, step+1)
  end

  def walkinmaze(string) do
    list = String.split(string,"\n")|>Enum.map(fn(x)->String.to_integer(x) end )
    step = Enum.at(list, 0)
    new_list = List.replace_at(list,0, step+1)
    walkinmaze(new_list, step, 1)
  end

  def walkinmaze(list, curr_pos, counter) do
    step = Enum.at(list, curr_pos)
    if step == nil do
      counter
    else
      new_list = List.replace_at(list,curr_pos, step + 1)
      walkinmaze(new_list, curr_pos + step, counter + 1)
    end
  end


  def walkinmaze2(string) do
    list = String.split(string,"\n")|>Enum.map(fn(x)->String.to_integer(x) end)
    step = Enum.at(list, 0)
    new_list = List.replace_at(list,0, step+1)
    walkinmaze2(new_list, step, 1)
  end

  def walkinmaze2(list, curr_pos, counter) do
    step = Enum.at(list, curr_pos)
    if step == nil do
      counter
    else

      offset =
        if step >=3 do
          step-1
        else
          step+1
        end

      new_list = List.replace_at(list,curr_pos, offset)
      walkinmaze2(new_list, curr_pos + step, counter + 1)
    end
  end
end
