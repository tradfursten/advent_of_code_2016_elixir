defmodule AdventOfCode.Day05 do
  def part1(args) do
    {String.trim(args), 1, ""}
    |> Stream.iterate(fn {s, i, _} ->
      {s, i + 1, get_hash(s, i)}
    end)
    |> Stream.reject(fn {_, _, hash} -> !String.starts_with?(hash, "00000") end)
    |> Enum.take(8)
    |> Enum.map(fn {_, _, hash} -> String.at(hash, 5) end)
    |> Enum.join("")
  end

  def part2(args) do
  end


  defp get_hash(s, i) do
    Base.encode16(:erlang.md5(s <> Integer.to_string(i)), case: :lower)
  end
end
