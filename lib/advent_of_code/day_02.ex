defmodule AdventOfCode.Day02 do
  def part1(args) do
    args
    |> String.codepoints()
    |> Enum.reduce([5], &get_code/2)
    |> Enum.reverse
    |> Enum.join("")
    |> String.to_integer()
  end

  def part2(args) do
    args
    |> String.trim
    |> String.codepoints()
    |> Enum.reduce([5], &get_code_2/2)
    |> Enum.reverse
    |> Enum.map(&to_display/1)
    |> Enum.join("")
  end

  defp get_code("\n", [i | tail]), do: [i | [i | tail]]

  defp get_code("U", [i | tail]) when i > 3, do: [i - 3 | tail]
  defp get_code("D", [i | tail]) when i < 7, do: [i + 3 | tail]
  defp get_code("L", [i | tail]) when i not in [1, 4, 7], do: [i - 1 | tail]
  defp get_code("R", [i | tail]) when i not in [3, 6, 9], do: [i + 1 | tail]

  defp get_code(_, acc), do: acc

  defp get_code_2("\n", [i | tail]), do: [i | [i | tail]]

  defp get_code_2("U", [i | tail]) when i in [6, 7, 8, 10, 11, 12], do: [i - 4 | tail]
  defp get_code_2("U", [i | tail]) when i in [3, 13], do: [i - 2 | tail]
  defp get_code_2("D", [i | tail]) when i in [2, 3, 4, 6, 7, 8], do: [i + 4 | tail]
  defp get_code_2("D", [i | tail]) when i in [1, 11], do: [i + 2 | tail]
  defp get_code_2("L", [i | tail]) when i not in [1, 2, 5, 10, 13], do: [i - 1 | tail]
  defp get_code_2("R", [i | tail]) when i not in [1, 4, 9, 12, 13], do: [i + 1 | tail]

  defp get_code_2(_, acc), do: acc

  defp to_display(10), do: "A"
  defp to_display(11), do: "B"
  defp to_display(12), do: "C"
  defp to_display(13), do: "D"
  defp to_display(a), do: a
end
