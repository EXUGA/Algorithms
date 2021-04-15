defmodule Algorithms.DataStructures.Zipper.ListZipper do
  @moduledoc """
  TODO: add description and zipper explanation
  """

  @type zip :: %{left: list, current: any, right: list}

  def run(list) do
    list
    |> IO.inspect(label: "right: ")
    |> to_zipper()
    |> right()
    |> IO.inspect(label: "right: ")
    |> right()
    |> IO.inspect(label: "delete: ")
  end

  @doc """
  TO LIST
  """
  @spec to_list(zip) :: list

  def to_list(%{current: current, left: left, right: right}) do
    [current | left]
    |> Enum.reverse()
    |> Enum.concat(right)
    |> Enum.filter(&(&1 != nil))
  end

  @doc """
  TO ZIPPER
  """
  @spec to_zipper(list) :: zip

  def to_zipper([head | tail]) do
    # zipper: {left: [], current: x, right: []}
    %{left: [], current: head, right: tail}
  end

  @doc """
  LEFT
  """
  @spec left(zip) :: zip

  def left(z = %{current: nil, left: [], right: _}), do: z

  def left(%{current: current, left: [], right: right}) do
    %{ current: nil, left: [], right: [current | right] }
  end

  def left(%{current: nil, left: [l_head | l_rest], right: right}) do
    %{ current: l_head, left: l_rest, right: right }
  end

  def left(%{current: current, left: [l_head | l_rest], right: right}) do
    %{ current: l_head, left: l_rest, right: [current | right] }
  end

  @doc """
  RIGHT
  """
  @spec right(zip) :: zip

  def right(z = %{current: nil, left: _, right: _}), do: z

  def right(%{current: current, left: left, right: []}) do
    %{ current: nil, right: [], left: [current | left] }
  end

  def right(%{current: nil, left: left, right: [r_head | r_rest]}) do
    %{ current: r_head, right: r_rest, left: left }
  end

  def right(%{current: current, left: left, right: [r_head | r_rest]}) do
    %{ current: r_head, right: r_rest, left: [current | left] }
  end

  @doc """
  INSERT
  """
  @spec insert(zip, any) :: zip

  def insert(%{current: current, left: left, right: right}, value) do
    %{ current: value, left: left, right: [current | right] }
  end

  @doc """
  DELETE
  """
  @spec delete(zip) :: zip

  def delete(%{current: _, left: left, right: []}) do
    %{ current: nil, left: left, right: []}
  end
  def delete(%{current: _, left: left, right: [r_head | r_rest]}) do
    %{ current: r_head, left: left, right: r_rest }
  end

  @doc """
  REPLACE
  """
  @spec replace(zip, any) :: zip

  def replace(%{current: _, left: left, right: right}, value) do
    %{ current: value, left: left, right: right }
  end

  @doc """
  VALUE
  """
  @spec value(zip) :: any

  def value(%{current: current, left: _, right: _}) do
    current
  end

  @doc """
  GO TO TAIL
  """
  @spec to_tail(zip) :: zip

  def to_tail(z = %{current: nil, left: _, right: []}), do: z
  def to_tail(z = %{current: _, left: _, right: _}) do
    to_tail(right(z))
  end

end
