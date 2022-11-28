defmodule SICP.Ch1.Ex10Test do
  use ExUnit.Case
  doctest SICP.Ch1.Ex10

  import SICP.Ch1.Ex10

  @tag task: 110
  test "my_f" do
    Enum.each([0, 1, 2, 3], fn(n) ->
      assert f(n) === my_f(n)
    end)
  end

  @tag task: 110
  test "my_g" do
    Enum.each([0, 1, 2, 3], fn(n) ->
      assert g(n) === my_g(n)
    end)
  end

  @tag task: 110
  test "my_h" do
    Enum.each([0, 1, 2, 3], fn(n) ->
      assert h(n) === my_h(n)
    end)
  end
end
