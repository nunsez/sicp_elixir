defmodule Sicp.Ch1.S3.Ex42Test do
  use ExUnit.Case
  doctest Sicp.Ch1.S3.Ex42

  import Sicp.Common, only: [inc: 1, square: 1]
  import Sicp.Ch1.S3.Ex42, only: [compose: 2]

  @tag task: 142
  test "compose/2" do
    f = compose(&square/1, &inc/1)
    assert f.(6) == 49
  end
end
