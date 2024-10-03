defmodule Sicp.Ch1.S3.Ex32Test do
  use ExUnit.Case
  doctest Sicp.Ch1.S3.Ex32

  import Sicp.Ch1.S3.Ex32, only: [sum: 4, product: 4]
  import Sicp.Common, only: [inc: 1]

  @tag task: 132
  test "sum/4" do
    assert sum(&Function.identity/1, 1, &inc/1, 10) == 55
  end

  @tag task: 132
  test "product/4" do
    assert product(&Function.identity/1, 1, &inc/1, 7) == 5_040
  end
end
