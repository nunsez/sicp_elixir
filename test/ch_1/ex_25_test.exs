defmodule SICP.Ch1.Ex25Test do
  use ExUnit.Case
  doctest SICP.Ch1.Ex25

  alias SICP.Ch1.{Ex24, Ex25}

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
    100_043
  ]

  @tag task: 125
  test "fast_exp" do
    assert Ex25.fast_prime?(1009, @attempts) == true
    assert Ex25.fast_prime?(1013, @attempts) == true
    assert Ex25.fast_prime?(1019, @attempts) == true
    assert Ex25.fast_prime?(10_007, @attempts) == true
    assert Ex25.fast_prime?(10_009, @attempts) == true
    assert Ex25.fast_prime?(10_037, @attempts) == true
    assert Ex25.fast_prime?(100_003, @attempts) == true
    assert Ex25.fast_prime?(100_019, @attempts) == true
    assert Ex25.fast_prime?(100_043, @attempts) == true
  end

  @tag :benchmark
  @tag timeout: 300_000
  @tag task: 125
  test "benchmark" do
    Benchee.run(
      %{
        "Ex24 fast_prime?" => fn input -> Ex24.fast_prime?(input, @attempts) end,
        "Ex25 fast_prime? (fast_exp)" => fn input -> Ex25.fast_prime?(input, @attempts) end
      },
      inputs: Enum.map(@numbers, fn x -> {x, x} end)
    )
  end
end
