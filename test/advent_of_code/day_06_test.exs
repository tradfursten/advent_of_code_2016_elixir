defmodule AdventOfCode.Day06Test do
  use ExUnit.Case

  import AdventOfCode.Day06

  test "part1" do
    input = """
eedadn
drvtee
eandsr
raavrd
atevrs
tsrnev
sdttsa
rasrtv
nssdts
ntnada
svetve
tesnvt
vntsnd
vrdear
dvrsen
enarar
""" |> String.trim
    result = part1(input)
    IO.inspect(result)
    assert result
  end

  test "part2" do
    input = """
eedadn
drvtee
eandsr
raavrd
atevrs
tsrnev
sdttsa
rasrtv
nssdts
ntnada
svetve
tesnvt
vntsnd
vrdear
dvrsen
enarar
""" |> String.trim
    result = part2(input)

    IO.inspect(result)

    assert result
  end
end
