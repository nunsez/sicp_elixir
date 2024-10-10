defmodule Sicp.Ch1.S3.Ex38Test do
  use ExUnit.Case
  doctest Sicp.Ch1.S3.Ex38

  import Sicp.Ch1.S3.Ex38, only: [e: 1]

  @tag task: 138
  test "euler_e/1" do
    e = e(12)
    # ln(e) == 1
    assert_in_delta(:math.log(e), 1, 0.000_01)
  end
end
