defmodule Sicp.Ch1.S2.Ex24Test do
  use ExUnit.Case
  doctest Sicp.Ch1.S2.Ex24

  alias Sicp.Ch1.S2.{Ex22, Ex24}

  @attempts 1

  @numbers [
    1009,
    1013,
    1019,
    10_007,
    10_009,
    10_037,
    100_003,
    100_019,
    100_043,
    1_000_003,
    1_000_033,
    1_000_037
  ]

  @tag task: 124
  test "fast_prime?" do
    assert Ex24.fast_prime?(1009, @attempts) == true
    assert Ex24.fast_prime?(1013, @attempts) == true
    assert Ex24.fast_prime?(1019, @attempts) == true
    assert Ex24.fast_prime?(10_007, @attempts) == true
    assert Ex24.fast_prime?(10_009, @attempts) == true
    assert Ex24.fast_prime?(10_037, @attempts) == true
    assert Ex24.fast_prime?(100_003, @attempts) == true
    assert Ex24.fast_prime?(100_019, @attempts) == true
    assert Ex24.fast_prime?(100_043, @attempts) == true
    assert Ex24.fast_prime?(1_000_003, @attempts) == true
    assert Ex24.fast_prime?(1_000_033, @attempts) == true
    assert Ex24.fast_prime?(1_000_037, @attempts) == true
  end

  @tag :benchmark
  @tag timeout: 300_000
  @tag task: 124
  test "benchmark" do
    Benchee.run(
      %{
        "Ex22 prime?" => fn number -> Ex22.prime?(number) end,
        "Ex24 fast_prime?" => fn number -> Ex24.fast_prime?(number, @attempts) end
      },
      inputs: Enum.map(@numbers, fn x -> {x, x} end)
    )
  end
end
