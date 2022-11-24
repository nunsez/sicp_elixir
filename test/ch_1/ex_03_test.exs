defmodule SICP.Ch1.Ex03Test do
  use ExUnit.Case
  doctest SICP.Ch1.Ex03

  import SICP.Ch1.Ex03, only: [solution: 3]

  @tag task: 103
  test "args are not sorted" do
    assert solution(4, 2, 3) === 25
  end

  @tag task: 103
  test "args are equal to zero" do
    assert solution(0, 0, 0) === 0
  end

  @tag task: 103
  test "args are equal" do
    assert solution(2, 2, 2) === 8
  end

  @tag task: 103
  test "two of args are equal" do
    assert solution(1, 0, 1) === 2
  end

  @tag task: 103
  test "minimum arg is not unique" do
    assert solution(2, 2, 3) === 13
  end
end
