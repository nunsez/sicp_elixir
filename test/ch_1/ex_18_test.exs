defmodule SICP.Ch1.Ex18Test do
  use ExUnit.Case
  doctest SICP.Ch1.Ex18

  import SICP.Ch1.Ex18, only: [mul_iter: 2]

  @tag task: 118
  test "mul_iter multiply by 0" do
    assert mul_iter(5, 0) === 0
    assert mul_iter(0, 5) === 0
  end

  @tag task: 118
  test "mul_iter multiply by 1" do
    assert mul_iter(1, 1) === 1
  end

  @tag task: 118
  test "mul_iter common cases" do
    assert mul_iter(5, 15) === 5 * 15
    assert mul_iter(40, 30) === 40 * 30
  end
end
