defmodule SICP.Ch1.Ex31Test do
  use ExUnit.Case
  doctest SICP.Ch1.Ex31

  import SICP.Ch1.Ex31, only: [factorial_rec: 1, factorial_iter: 1, wallis_pi: 1]

  @tag task: 131
  test "factorial_rec/1" do
    assert factorial_rec(0) == 1
    assert factorial_rec(1) == 1
    assert factorial_rec(2) == 2
    assert factorial_rec(5) == 120
    assert factorial_rec(7) == 5_040
  end

  @tag task: 131
  test "factorial_iter/1" do
    assert factorial_iter(0) == 1
    assert factorial_iter(1) == 1
    assert factorial_iter(2) == 2
    assert factorial_iter(5) == 120
    assert factorial_iter(7) == 5_040
  end

  @tag task: 131
  test "wallis_pi/1" do
    assert_in_delta wallis_pi(100), :math.pi() / 4, 0.01
  end
end
