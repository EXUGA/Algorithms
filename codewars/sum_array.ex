# CODEWARS: https://www.codewars.com/kata/53dc54212259ed3d4f00071c/elixir

# Take an Array of numbers, return the sum of the numbers
# the number can be negative, positive and also not integer
# if the array is empty return 0

# EXAMPLES:
# [1, 5.2, 4, 0, -1] == 9.2
# [] = 0

defmodule Algorithms.CodeWars.SumNumbers do

  @doc """
  take a list and return the sum of the elements
  """
  @spec sum(list(number)) :: number

  def sum([]) do 0 end
  def sum(numbers) do
    Enum.reduce(numbers, fn (number, acc) -> acc + number end)
  end

end
