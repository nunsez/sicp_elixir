defmodule Sicp.Ch1.S3.Ex41Test do
  use ExUnit.Case
  doctest Sicp.Ch1.S3.Ex41

  import Sicp.Common, only: [inc: 1]
  import Sicp.Ch1.S3.Ex41, only: [double: 1]

  @tag task: 141
  test "double/1 single application on inc/1" do
    f = double(&inc/1)
    assert f.(2) == 4
  end

  @tag task: 141
  test "double/1 double application on inc/1" do
    f = double(&double/1).(&inc/1)
    assert f.(5) == 9
  end

  @tag task: 141
  test "double/1 triple application on inc/1" do
    f = double(double(&double/1)).(&inc/1)
    assert f.(5) == 21
  end

  @tag task: 141
  test "double/1 quadruple application on inc/1" do
    f = double(double(double(&double/1))).(&inc/1)
    assert f.(5) == 261
  end
end
