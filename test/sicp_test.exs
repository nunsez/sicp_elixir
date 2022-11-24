defmodule SICPTest do
  use ExUnit.Case
  doctest SICP

  test "greets the world" do
    assert SICP.hello() == :world
  end
end
