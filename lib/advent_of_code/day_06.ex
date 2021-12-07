defmodule AdventOfCode.Day06 do
  def part1(args) do
    args
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn x -> x 
      |> String.split("") 
      |> Enum.filter(fn a -> a != "" end) 
      end)
    |> Enum.zip
    |> Enum.map(fn l -> 
      l 
      |> Tuple.to_list 
      |> Enum.frequencies
      |> Map.to_list()
      |> Enum.max_by(fn {_, i} -> i end)
    end)
    |> Enum.map(fn {a, _} -> a end)
    |> Enum.join("")
  end

  def part2(args) do
    args
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn x -> x 
      |> String.split("") 
      |> Enum.filter(fn a -> a != "" end) 
      end)
    |> Enum.zip
    |> Enum.map(fn l -> 
      l 
      |> Tuple.to_list 
      |> Enum.frequencies
      |> Map.to_list()
      |> Enum.min_by(fn {_, i} -> i end)
    end)
    |> Enum.map(fn {a, _} -> a end)
    |> Enum.join("")
  end
end
