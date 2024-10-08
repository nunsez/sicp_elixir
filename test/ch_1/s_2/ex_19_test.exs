defmodule Sicp.Ch1.S2.Ex19Test do
  use ExUnit.Case
  doctest Sicp.Ch1.S2.Ex19

  import Sicp.Ch1.S2.Ex19, only: [fib: 1]

  @tag task: 119
  test "fib 1" do
    assert fib(1) === 1
  end

  @tag task: 119
  test "fib 2" do
    assert fib(2) === 1
  end

  @tag task: 119
  test "fib 7" do
    assert fib(7) === 13
  end

  @tag task: 119
  test "fib 8" do
    assert fib(8) === 21
  end
end
