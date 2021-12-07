defmodule AdventOfCode.Day07Test do
  use ExUnit.Case

  import AdventOfCode.Day07

  test "part1" do
    input = """
abba[mnop]qrst
abcd[bddb]xyyx
aaaa[qwer]tyui
ioxxoj[asdfgh]zxcvbn
"""
    result = part1(input)
    IO.inspect(result)
    assert result
  end

  test "part2" do
    input = """
aba[bab]xyz
xyx[xyx]xyx
aaa[kek]eke
zazbz[bzb]cdb
yytzgmmuqrfqegalpow[eyefbjmsyximixd]sgxjxpfncigzmft[zuwduxnhjiidywvsm]qmdvambkreelttqmv[mqhlvabyxnmnjfpkigl]vuxmnunvxclyhkxi
"""
    result = part2(input)

    IO.inspect(result)

    assert result
  end
end
