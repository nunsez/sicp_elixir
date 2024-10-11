defmodule Sicp.Ch1.S3.Ex39Test do
  use ExUnit.Case
  doctest Sicp.Ch1.S3.Ex39

  import Sicp.Ch1.S3.Ex39, only: [tan_cf: 2]

  @tag task: 139
  test "tan_cf/2 on 0 rad" do
    rad = 0
    assert_in_delta(tan_cf(rad, 12), :math.tan(rad), 0.000_01)
  end

  @tag task: 139
  test "tan_cf/2 on 2 rad" do
    rad = 2
    assert_in_delta(tan_cf(rad, 12), :math.tan(rad), 0.000_01)
  end

  @tag task: 139
  test "tan_cf/2 on pi rad" do
    rad = :math.pi()
    assert_in_delta(tan_cf(rad, 12), :math.tan(rad), 0.000_01)
  end
end
