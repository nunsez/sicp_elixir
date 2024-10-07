defmodule Sicp.Ch1.S3.Ex35Test do
  use ExUnit.Case
  doctest Sicp.Ch1.S3.Ex35

  import Sicp.Ch1.S3.Ex35, only: [solution: 0]
  import Sicp.Ch1.S3, only: [tolerance: 0]

  def golden_ratio do
    1.618_033_988_749_894
  end

  test "golden_ratio" do
    assert_in_delta(solution(), golden_ratio(), tolerance())
  end
end
