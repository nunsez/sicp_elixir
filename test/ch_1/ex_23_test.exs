defmodule SICP.Ch1.Ex23Test do
  use ExUnit.Case
  doctest SICP.Ch1.Ex23

  import SICP.Ch1.Ex23, only: [timed_prime_test: 1]

  @tag task: 123
  test "timed_prime_test for 1009" do
    assert timed_prime_test(1009) == true
  end

  @tag task: 123
  test "timed_prime_test for 1013" do
    assert timed_prime_test(1013) == true
  end

  @tag task: 123
  test "timed_prime_test for 1019" do
    assert timed_prime_test(1019) == true
  end

  @tag task: 123
  test "timed_prime_test for 10_007" do
    assert timed_prime_test(10_007) == true
  end

  @tag task: 123
  test "timed_prime_test for 10_009" do
    assert timed_prime_test(10_009) == true
  end

  @tag task: 123
  test "timed_prime_test for 10_037" do
    assert timed_prime_test(10_037) == true
  end

  @tag task: 123
  test "timed_prime_test for 100_003" do
    assert timed_prime_test(100_003) == true
  end

  @tag task: 123
  test "timed_prime_test for 100_019" do
    assert timed_prime_test(100_019) == true
  end

  @tag task: 123
  test "timed_prime_test for 100_043" do
    assert timed_prime_test(100_043) == true
  end

  @tag task: 123
  test "timed_prime_test for 1_000_003" do
    assert timed_prime_test(1_000_003) == true
  end

  @tag task: 123
  test "timed_prime_test for 1_000_033" do
    assert timed_prime_test(1_000_033) == true
  end

  @tag task: 123
  test "timed_prime_test for 1_000_037" do
    assert timed_prime_test(1_000_037) == true
  end
end
