defmodule SICP.Ch1.Ex28Test do
  use ExUnit.Case
  doctest SICP.Ch1.Ex28

  import SICP.Ch1.Ex28, only: [miller_rabin_test: 1, fast_prime?: 2]

  @tag task: 128
  test "miller_rabin_test" do
    assert miller_rabin_test(1009)
    refute miller_rabin_test(561)
  end

  @tag task: 128
  test "fast_prime?" do
    assert fast_prime?(2, 10)
    assert fast_prime?(239, 10)
    assert fast_prime?(1009, 10)

    refute fast_prime?(4, 10)
    refute fast_prime?(99, 10)
    refute fast_prime?(561, 10)
  end
end
