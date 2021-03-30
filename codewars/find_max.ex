defmodule FindMax do
  @moduledoc """
  take an array and find the two maximum.
  return it as a list in ascending order.
  EXAMPLE:
  [6,5,83,5,3,18]) == [18, 83]
  """

  @typedoc """
  main function
  """
  def two_oldest_ages([head | rest]) do
    find_max(rest, {0, head})
  end

  @doc """
  recursive function that find the two maximum
  """
  def find_max([], {min, max}) do
    [min, max]
  end
  def find_max([head | rest], {min, max}) do
    cond do
      head < min -> find_max(rest, {min, max})
      head < max -> find_max(rest, {head, max})
      :true -> find_max(rest, {max, head})
    end
  end

end
