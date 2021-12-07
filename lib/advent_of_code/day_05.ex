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
    {String.trim(args), 1, ""}
    |> Stream.iterate(fn {s, i, _} ->
      {s, i + 1, get_hash(s, i)}
    end)
    |> Stream.reject(fn {_, _, hash} -> !String.starts_with?(hash, "00000") end)
    |> Enum.reduce_while(%{}, fn {_, _id, hash}, acc -> 
      if Kernel.map_size(acc) == 8 do
        {:halt, acc}
      else
        with c <- String.at(hash, 5),
             {i, ""} when i >= 0 and i <= 7 <- Integer.parse(c),
             false <- Map.has_key?(acc, i)
        do
          {:cont, Map.put(acc, i, String.at(hash, 6))}
        else
          _ -> {:cont, acc}
        end
      end
    end)
    |> Enum.sort(fn {a, _}, { b, _} -> a < b end)
    |> Enum.map(fn {_i, c} -> c end)
    |> Enum.join("")
  end

  defp get_hash(s, i) do
    Base.encode16(:erlang.md5(s <> Integer.to_string(i)), case: :lower)
  end
end
