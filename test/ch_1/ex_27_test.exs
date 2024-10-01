defmodule SICP.Ch1.Ex27Test do
  use ExUnit.Case
  doctest SICP.Ch1.Ex27

  import SICP.Ch1.Ex27, only: [check: 1]

  @tag task: 127
  test "prime numbers check" do
    assert check(13)
    assert check(113)
    assert check(199)
  end

  @tag task: 127
  test "carmichael numbers check" do
    assert check(561)
    assert check(1105)
    assert check(1729)
    assert check(2465)
    assert check(2821)
    assert check(6601)
  end
end
