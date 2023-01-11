defmodule SICP.Ch1.Ex16Test do
  use ExUnit.Case
  doctest SICP.Ch1.Ex16

  import SICP.Ch1.Ex16, only: [solution: 2]

  @tag task: 116
  test "fast-exp zero number" do
    assert solution(0, 5) === 0
  end

  @tag task: 116
  test "fast-exp zero exponent" do
    assert solution(10, 0) === 1
  end

  @tag task: 116
  test "fast-exp common cases" do
    assert solution(2, 10) === 1_024
    assert solution(3, 20) === 3_486_784_401
  end
end
