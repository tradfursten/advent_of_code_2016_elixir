defmodule AdventOfCode.Day04 do
  def part1(args) do
    a = args
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&parse/1)
    |> Enum.map(&check/1)
    |> Enum.map(fn {_n, id} -> id end)
    |> Enum.sum
    a
  end

  def part2(args) do
    a = args
    |> String.trim
    |> String.split("\n")
    |> Enum.map(&parse/1)
    |> Enum.map(&check/1)
    |> Enum.map(&decrypt/1)
    |> Enum.filter(fn {_, id} -> id != 0 end)
    |> Enum.filter(fn {n, _} -> String.contains?(n, "north") end)
  end

  defp decrypt({n, id}) do
    room = do_decrypt(String.to_charlist(n), id, [])
    |> List.to_string()
    |> String.reverse()
    {room, id}
  end

  defp do_decrypt([], _, acc), do: acc

  defp do_decrypt([?- | tail], id, acc), do: do_decrypt(tail, id, [' ' | acc])

  defp do_decrypt([c | tail], id, acc) do
    do_decrypt(tail, id, [rotate(c, id) | acc])
  end

  defp rotate(c, dist) do
    97 + rem(c - 71 + dist, 26)
  end

  defp check({n, id, c}) do
    computed_checksum = n
    |> String.replace("-", "")
    |> String.graphemes
    |> Enum.frequencies
    |> Map.to_list
    |> Enum.sort(fn {a, c1}, {b, c2} ->
        case c1 do
          ^c2 -> a < b
          _  -> c1 > c2
        end
      end)
    |> Enum.take(5)
    |> Enum.map(fn {a, _c} -> a end)
    |> Enum.join("")
    case computed_checksum do
      ^c -> {n, String.to_integer(id)}
      _ -> {n, 0}
    end
  end

  defp parse(s) do
    [_, name, id, checksum] = Regex.run(~r/(.*)-(\d+)\[(\w+)\]/, s)
    {name, id, checksum}
  end
    
end
