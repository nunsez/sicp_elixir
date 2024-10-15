defmodule Sicp.Ch1.S3.Ex46Test do
  use ExUnit.Case
  doctest Sicp.Ch1.S3.Ex46

  import Sicp.Ch1.S3.Ex46, only: [sqrt: 1, fixed_point: 3, tolerance: 0]

  @tag task: 146
  test "sqrt/1" do
    assert_in_delta(sqrt(16), 4, tolerance())
    assert_in_delta(sqrt(225), 15, tolerance())
  end

  @tag task: 146
  test "fixed_point/3" do
    f = fn x -> 1 + 1 / x end
    result = fixed_point(f, 1.0, tolerance())
    assert_in_delta(result, 1.618_037, tolerance())
  end
end
