defmodule Sicp.Ch1.S2.Ex11Test do
  use ExUnit.Case
  doctest Sicp.Ch1.S2.Ex11

  import Sicp.Ch1.S2.Ex11, only: [f: 1, f_iter: 1]

  @tag task: 111
  test "recursive negative" do
    assert f(-1) === -1
  end

  @tag task: 111
  test "recursive zero" do
    assert f(0) === 0
  end

  @tag task: 111
  test "recursive 2" do
    assert f(2) === 2
  end

  @tag task: 111
  test "recursive 3" do
    assert f(3) === 4
  end

  @tag task: 111
  test "recursive 4" do
    assert f(4) === 11
  end

  @tag task: 111
  test "iterative negative" do
    assert f_iter(-1) === -1
  end

  @tag task: 111
  test "iterative zero" do
    assert f_iter(0) === 0
  end

  @tag task: 111
  test "iterative 2" do
    assert f_iter(2) === 2
  end

  @tag task: 111
  test "iterative 3" do
    assert f_iter(3) === 4
  end

  @tag task: 111
  test "iterative 4" do
    assert f_iter(4) === 11
  end

  @tag task: 111
  test "recursive equals iterative" do
    assert f(6) === f_iter(6)
  end
end
