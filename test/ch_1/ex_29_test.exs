defmodule SICP.Ch1.Ex29Test do
  use ExUnit.Case
  doctest SICP.Ch1.Ex29

  import SICP.Ch1.Ex29, only: [simpsons_rule: 4, integral: 4]
  import SICP.Common, only: [cube: 1]

  @tag task: 129
  test "n == 100" do
    assert_in_delta(
      simpsons_rule(&cube/1, 0, 1, 100),
      integral(&cube/1, 0, 1, 0.01),
      1.0e-4
    )
  end

  @tag task: 129
  test "n == 1000" do
    assert_in_delta(
      simpsons_rule(&cube/1, 0, 1, 1000),
      integral(&cube/1, 0, 1, 0.001),
      1.0e-6
    )
  end
end
