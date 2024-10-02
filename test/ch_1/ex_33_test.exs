defmodule SICP.Ch1.Ex33Test do
  use ExUnit.Case
  doctest SICP.Ch1.Ex33

  import SICP.Ch1.Ex33, only: [sum_prime_squares: 2, product_relative_primes: 1]

  @tag task: 133
  test "sum_prime_squares/2" do
    assert sum_prime_squares(1, 10) == 87
  end

  @tag task: 133
  test "product_relative_primes/1" do
    assert product_relative_primes(10) == 189
  end
end
