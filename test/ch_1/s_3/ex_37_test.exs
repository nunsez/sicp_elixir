defmodule Sicp.Ch1.S3.Ex37Test do
  use ExUnit.Case
  doctest Sicp.Ch1.S3.Ex37

  import Sicp.Ch1.S3.Ex37, only: [cont_frac_rec: 3, cont_frac_iter: 3]

  @tag task: 137
  test "cont_frac_rec/3" do
    f = fn _ -> 1 end
    res = cont_frac_rec(f, f, 12)
    assert_in_delta(res, 0.618_03, 0.000_01)
  end

  @tag task: 137
  test "cont_frac_iter/3" do
    f = fn _ -> 1 end
    res = cont_frac_iter(f, f, 12)
    assert_in_delta(res, 0.618_03, 0.000_01)
  end
end
