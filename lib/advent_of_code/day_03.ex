defmodule AdventOfCode.Day03 do
  def part1(args) do
    l = args
    |> String.trim
    |> String.split("\n")
    |> Enum.filter(&is_triangle?/1)
    length(l)
  end

  def part2(args) do
    args
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn x -> x 
      |> String.split(~r/ +/) 
      |> Enum.filter(fn a -> a != "" end) 
      |> Enum.map(&String.to_integer/1) end)
    |> Enum.reduce({[],[],[]}, fn [a, b, c], {aa, ba, ca} -> {[a | aa], [b | ba], [c | ca]} end)
    |> fn {a, b, c} -> a ++ b ++ c |> Enum.chunk_every(3) end.()
    |> Enum.filter(&triangle?/1)
    |> Enum.count()
  end

  defp is_triangle?(s) do
    s
    |> String.trim
    |> String.replace(~r/ +/, " ")
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
    |> triangle?()
    #(Enum.at(t, 0) + Enum.at(t, 1)) > Enum.at(t, 2) and (Enum.at(t, 0) + Enum.at(t, 2)) > Enum.at(t, 1) and (Enum.at(t, 2) + Enum.at(t, 1)) > Enum.at(t, 0)
  end

  defp triangle?([a, b, c]) do
    (a + b) > c && (a + c) > b && (b + c) > a
  end
end
