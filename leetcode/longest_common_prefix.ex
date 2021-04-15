# LEETCODE: https://leetcode.com/problems/longest-common-prefix/
#
# Write a function to find the longest common prefix string amongst an array of strings.
# If there is no common prefix, return an empty string "".
#
# EXAMPLE 1:
# Input: strs = ["flower","flow","flight"]
# Output: "fl"
#
# EXAMPLE: 2
# Input: strs = ["dog","racecar","car"]
# Output: ""

defmodule Algorithms.Leetcode.LongestCommonPrefix do
    
    @spec longest_common_prefix(list(string)) :: string
    def longest_common_prefix([]), do: ""
    def longest_common_prefix(list) do
        list
        |> Enum.map(&(String.graphemes(&1)))
        |> algorithm([])
    end
 
    # [ "flower", "flow", "flight" ]
    # [ ["f"]["lower"], ["f"]["low"], ["f"]["light"] ]
    def algorithm(list, accumulator) do
        [ hd_head | hd_rest ] = Enum.map(list, &(hd(&1)))
        tl_list = Enum.map(list, &(tl(&1)))
        areAllEquals? = Enum.all?(hd_rest, &(&1 == hd_head))
        case areAllEquals? do
            false -> accumulator
            true -> algorithm(tl_list, [hd_head | accumulator])
        end
    end

end
