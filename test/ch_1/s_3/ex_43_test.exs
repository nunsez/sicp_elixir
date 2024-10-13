defmodule Sicp.Ch1.S3.Ex43Test do
  use ExUnit.Case
  doctest Sicp.Ch1.S3.Ex43

  import Sicp.Common, only: [square: 1]
  import Sicp.Ch1.S3.Ex43, only: [repeated: 2]

  @tag task: 143
  test "repeated/2" do
    f = repeated(&square/1, 2)
    assert f.(5) == 625
  end
end
