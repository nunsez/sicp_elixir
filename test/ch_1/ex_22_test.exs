defmodule SICP.Ch1.Ex22Test do
  use ExUnit.Case
  doctest SICP.Ch1.Ex22

  import SICP.Ch1.Ex22, only: [prime?: 1]

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

  @tag task: 122
  test "prime?" do
    assert prime?(1009) == true
    assert prime?(1013) == true
    assert prime?(1019) == true
    assert prime?(10_007) == true
    assert prime?(10_009) == true
    assert prime?(10_037) == true
    assert prime?(100_003) == true
    assert prime?(100_019) == true
    assert prime?(100_043) == true
    assert prime?(1_000_003) == true
    assert prime?(1_000_033) == true
    assert prime?(1_000_037) == true
  end

  @tag :benchmark
  @tag timeout: 300_000
  @tag task: 122
  test "benchmark numbers" do
    Benchee.run(
      %{
        "Ex22 prime?" => fn number -> prime?(number) end
      },
      inputs: Enum.map(@numbers, fn x -> {x, x} end)
    )
  end

  @tag :benchmark
  @tag task: 122
  test "benchmark 100_000_007" do
    Benchee.run(%{
      "100_000_007" => fn -> prime?(100_000_007) end
    })
  end

  @tag :benchmark
  @tag task: 122
  test "benchmark 1_000_000_007" do
    Benchee.run(%{
      "1_000_000_007" => fn -> prime?(1_000_000_007) end
    })
  end
end
