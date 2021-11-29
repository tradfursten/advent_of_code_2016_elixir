defmodule AdventOfCode.Day03Test do
  use ExUnit.Case

  import AdventOfCode.Day03

  test "part1" do
    input = "5 10 25"
    result = part1(input)

    assert result == 0
  end

  test "part2" do
    input = """
 101 301 501
102  302 502
103 303  503
201  401  601
202  402 602
203 403 603
"""
    result = part2(input)

    assert result == 6
  end
end
