defmodule SICP.Ch1.Ex11Test do
  use ExUnit.Case
  doctest SICP.Ch1.Ex11

  import SICP.Ch1.Ex11, only: [f: 1, f_iter: 1]

  test "recursive negative" do
    assert f(-1) === -1
  end

  test "recursive zero" do
    assert f(0) === 0
  end

  test "recursive 2" do
    assert f(2) === 2
  end

  test "recursive 3" do
    assert f(3) === 4
  end

  test "recursive 4" do
    assert f(4) === 11
  end

  test "iterative negative" do
    assert f_iter(-1) === -1
  end

  test "iterative zero" do
    assert f_iter(0) === 0
  end

  test "iterative 2" do
    assert f_iter(2) === 2
  end

  test "iterative 3" do
    assert f_iter(3) === 4
  end

  test "iterative 4" do
    assert f_iter(4) === 11
  end

  test "recursive equals iterative" do
    assert f(6) === f_iter(6)
  end
end
