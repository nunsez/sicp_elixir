defmodule Sicp.Ch1.S1.Ex07Test do
  use ExUnit.Case
  doctest Sicp.Ch1.S1.Ex07

  import Sicp.Ch1.S1.Ex07, only: [square_root: 1]

  @tag task: 107
  test "small" do
    result = square_root(0.04) * 1_000
    assert round(result) === 200
  end

  @tag task: 107
  test "decimal" do
    result = square_root(4.0) * 1_000
    assert round(result) === 2_000
  end

  @tag task: 107
  test "medium" do
    result = square_root(100) * 1_000
    assert round(result) === 10_000
  end

  @tag task: 107
  test "large" do
    result = square_root(1_000_000.0) * 1_000
    assert round(result) === 1_000_000
  end
end
