defmodule SICP.Ch1.Ex30Test do
  use ExUnit.Case
  doctest SICP.Ch1.Ex30

  alias SICP.Ch1.Ex29
  alias SICP.Ch1.Ex30

  import SICP.Common, only: [cube: 1, inc: 1]

  @tag task: 130
  test "equality" do
    assert Ex29.sum(&cube/1, 1, &inc/1, 10) == Ex30.sum(&cube/1, 1, &inc/1, 10)
  end

  @tag :benchmark
  @tag task: 130
  test "benchmark" do
    Benchee.run(%{
      "Ex29 sum" => fn -> Ex29.sum(&cube/1, 1, &inc/1, 50) end,
      "Ex30 iter sum" => fn -> Ex30.sum(&cube/1, 1, &inc/1, 50) end
    })
  end
end
