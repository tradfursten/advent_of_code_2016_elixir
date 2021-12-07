defmodule AdventOfCode.Day07 do
  def part1(args) do
    args
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&is_tls_ipv7?/1)
    |> Enum.filter(fn l -> not Enum.empty?(l) end)
    |> Enum.filter(fn l -> 
      l
      |> Enum.all?(fn {_, x} -> x == true end)
    end)
    |> Enum.count()
    
  end

  # This function gave me an off by one error
  def part2(args) do
    args
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(fn l -> 
      String.split(l, ~r/\[|\]/) 
    end)
    |> Enum.reduce([], fn l, acc -> 
      a = l
      |> Enum.reduce({[],[], :ABA}, fn g, acc_inner -> 
        g
        |> String.codepoints()
        |> Enum.chunk_every(3, 1, :discard)
        |> Enum.map(&List.to_tuple/1)
        |> create_list(acc_inner)
      end)
      [a | acc]
    end)
    |> Enum.filter(fn {aba, bab, _} -> 
      is_ssl?(aba, bab) 
    end)
    |> Enum.map(fn i ->
      IO.inspect(i)
      i
      end)
    |> Enum.count()
  end

  defp is_tls_ipv7?(<<a::binary-size(1), b::binary-size(1), b::binary-size(1), a::binary-size(1)>> <> rest) when a != b do
    [{:tls, true} | is_tls_ipv7?(rest) ]
  end
  defp is_tls_ipv7?("[" <> rest), do: in_bracket_is_tls_ipv7?(rest)
  defp is_tls_ipv7?(<<_a::binary-size(1)>> <> rest), do: is_tls_ipv7?(rest)
  defp is_tls_ipv7?(_), do: []

  defp in_bracket_is_tls_ipv7?(<<a::binary-size(1), b::binary-size(1), b::binary-size(1), a::binary-size(1)>> <> _rest), do: [{:hypernet, false}]
  defp in_bracket_is_tls_ipv7?("]" <> rest), do: is_tls_ipv7?(rest)
  defp in_bracket_is_tls_ipv7?(<<_a::binary-size(1)>> <> rest), do: in_bracket_is_tls_ipv7?(rest)

  defp create_list([], {aba, bab, state}) do
    next_state = case state do
      :ABA -> :BAB
      :BAB -> :ABA
    end
    {aba, bab, next_state}
  end
  defp create_list([{x, y, x} | tail], {aba, bab, :ABA} = _acc) do 
    create_list(tail, {[ {x, y, x} | aba], bab, :ABA})
  end
  defp create_list([{x, y, x} | tail], {aba, bab, :BAB} = _acc) do 
    create_list(tail, {aba, [ {y, x, y} | bab], :BAB})
  end
  defp create_list([_ | tail], acc), do: create_list(tail, acc)
  
  defp is_ssl?([], _), do: false
  defp is_ssl?(_, []), do: false
  defp is_ssl?([a | tail], bab) do
    case Enum.any?(bab, fn g -> a == g end) do
      true -> true
      _ -> is_ssl?(tail, bab)
    end
  end
  #defp is_ssl?([_ | tail], bab), do: is_ssl?(tail, bab)
  
end
