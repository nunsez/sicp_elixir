defmodule SICP.Ch1.Ex23Test do
  use ExUnit.Case
  doctest SICP.Ch1.Ex23

  alias SICP.Ch1.{Ex22, Ex23}

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

  @tag task: 123
  test "prime?" do
    assert Ex23.prime?(1009) == true
    assert Ex23.prime?(1013) == true
    assert Ex23.prime?(1019) == true
    assert Ex23.prime?(10_007) == true
    assert Ex23.prime?(10_009) == true
    assert Ex23.prime?(10_037) == true
    assert Ex23.prime?(100_003) == true
    assert Ex23.prime?(100_019) == true
    assert Ex23.prime?(100_043) == true
    assert Ex23.prime?(1_000_003) == true
    assert Ex23.prime?(1_000_033) == true
    assert Ex23.prime?(1_000_037) == true
  end

  @tag :benchmark
  @tag timeout: 300_000
  @tag task: 123
  test "benchmark" do
    Benchee.run(
      %{
        "Ex22 prime?" => fn number -> Ex22.prime?(number) end,
        "Ex23 prime?" => fn number -> Ex23.prime?(number) end
      },
      inputs: Enum.map(@numbers, fn x -> {x, x} end)
    )
  end
end
