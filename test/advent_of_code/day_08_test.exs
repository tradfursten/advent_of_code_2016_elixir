defmodule AdventOfCode.Day08Test do
  use ExUnit.Case

  import AdventOfCode.Day08

  test "part1" do
    input = "16,1,2,0,4,2,7,1,2,14" |> String.trim
    result = part1(input)
    IO.inspect(result)

    assert result
  end

  test "part2" do
    input = "16,1,2,0,4,2,7,1,2,14" |> String.trim
    result = part2(input)
    IO.inspect(result)

    assert result
  end
end
