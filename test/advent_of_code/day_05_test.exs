defmodule AdventOfCode.Day05Test do
  use ExUnit.Case

  import AdventOfCode.Day05

  test "part1" do
    input = "abc"
    result = part1(input)
    IO.inspect(result)
    assert result
  end

  @tag :skip
  test "part2" do
    input = nil
    result = part2(input)

    assert result
  end
end
