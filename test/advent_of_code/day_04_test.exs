defmodule AdventOfCode.Day04Test do
  use ExUnit.Case

  import AdventOfCode.Day04

  test "part1" do
    input = "aaaaa-bbb-z-y-x-123[abxyz]"
    result = part1(input)

    assert result == 123
  end

  test "part2" do
    input = "aaaaa-bbb-z-y-x-2[abxyz]"
    result = part2(input)
    IO.inspect(result)
    assert result
  end
end
