defmodule SICP.Ch1.Ex08Test do
  use ExUnit.Case
  doctest SICP.Ch1.Ex08

  import SICP.Ch1.Ex08, only: [cube_root: 1]

  @tag task: 108
  test "small" do
    result = cube_root(0.008) * 1_000
    assert round(result) === 200
  end

  @tag task: 108
  test "decimal" do
    result = cube_root(8.0) * 1_000
    assert round(result) === 2_000
  end

  @tag task: 108
  test "medium" do
    result = cube_root(1000) * 1_000
    assert round(result) === 10_000
  end

  @tag task: 108
  test "large" do
    result = cube_root(1_000_000_000.0) * 1_000
    assert round(result) === 1_000_000
  end
end
