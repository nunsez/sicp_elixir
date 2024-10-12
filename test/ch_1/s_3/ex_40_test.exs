defmodule Sicp.Ch1.S3.Ex40Test do
  use ExUnit.Case
  doctest Sicp.Ch1.S3.Ex40

  import Sicp.Ch1.S3, only: [newtons_method: 2]
  import Sicp.Ch1.S3.Ex40, only: [cubic: 3]

  @tag task: 140
  test "cubic/3" do
    f = cubic(2, 4, 6)
    x = newtons_method(f, 1)
    assert_in_delta(x, -1.711, 0.001)
    assert_in_delta(f.(x), 0, 0.001)
  end
end
