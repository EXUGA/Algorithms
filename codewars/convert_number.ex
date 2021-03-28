# CODEWARS: https://www.codewars.com/kata/5583090cbe83f4fd8c000051/elixir

# Given a random non-negative number,
# you have to return the digits of this
# number within an array in reverse order.

# EXAMPLES:
# 348597 => [7,9,5,8,4,3]

defmodule Algorithms.CodeWars.ConvertNumber do
  @doc """
  take an integer and return a list of reversed digits
  """
  @spec digitize(integer) :: list(integer)

  def digitize(number) do
    number
    |> Integer.digits()
    |> Enum.reverse()
  end
end
