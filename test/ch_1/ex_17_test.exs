defmodule SICP.Ch1.Ex17Test do
  use ExUnit.Case
  doctest SICP.Ch1.Ex17

  import SICP.Ch1.Ex17, only: [fast_mul: 2]

  @tag task: 117
  test "fast_mul multiply by 0" do
    assert fast_mul(5, 0) === 0
    assert fast_mul(0, 5) === 0
  end

  @tag task: 117
  test "fast_mul multiply by 1" do
    assert fast_mul(1, 1) === 1
  end

  @tag task: 117
  test "fast_mul common cases" do
    assert fast_mul(5, 15) === 5 * 15
    assert fast_mul(40, 30) === 40 * 30
  end
end
