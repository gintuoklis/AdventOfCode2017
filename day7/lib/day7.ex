defmodule Tree do
  @moduledoc """
  Documentation for Tree.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Tree.hello
      :world

  """
  def processline(input) do
    if input =~ "->" do
      [left, right] = String.split(input,"->")
      childs = String.trim(right)|> String.split(", ")
      [parent, _trail] = String.trim(left)|>String.split(" ")
      #buidling map with {element, parent} pairs
      Enum.reduce(childs, %{}, fn(x, acc) -> Map.put(acc,x, %{name: x, parent: parent, weight: 0}) end)
    else
      %{}
    end
  end

  def buildtree(input) do
    lines = String.split(input, "\n")
    #merging maps of {element, parent} pairs into one big map
    Enum.reduce(lines, %{}, fn(x,acc) -> Map.merge(acc, processline(x)) end)
  end

  def findtopnode(input) do
    tree = buildtree(input)
    IO.inspect(tree)
    #just find the first node and start searching from there

    #program = Enum.fetch(tree,1)
    {_, programl} = Enum.fetch(tree,1)

    #{:ok, {"tmyne", %{name: "tmyne", parent: "oieobzw", weight: 0}}}
    IO.inspect(program)
    #backtolist = Enum.into(program, %{})
    #IO.inspect(backtolist)
    findtopnoderecursive(tree, program)
  end

  def findtopnoderecursive(_map, program, nil) do
    program
  end

  def findtopnoderecursive(map, program) do
    IO.inspect(program)
    IO.inspect(program.parent)
    newpgoram = Map.get(map, program.parent)

    #IO.inspect(parent_program)
    #IO.inspect(newpgoram)
    findtopnoderecursive(map,newpgoram)
  end

  ##newmapt =data |> Map.put(:b, :a) |>Map.put(:c, :a) |> Map.put(:a, :z) |> Map.put(:f, :z)
  ##String.split(String.trim(right), ", ", trim: true)
  ##Map.keys(map)|>take_random(1)

end
