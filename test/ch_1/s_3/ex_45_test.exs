defmodule Sicp.Ch1.S3.Ex45Test do
  use ExUnit.Case
  doctest Sicp.Ch1.S3.Ex45

  import Sicp.Ch1.S3.Ex45, only: [sqrt: 1, fourth_root: 1, nth_root: 3, nth_root: 2, tolerance: 0]

  @tag task: 145
  test "sqrt/1" do
    assert_in_delta(sqrt(16), 4, tolerance())
  end

  @tag task: 145
  @tag skip: "doesn't converge"
  test "fourth_root/1" do
    assert_in_delta(fourth_root(16), 2, tolerance())
  end

  @tag task: 145
  test "nth_root/3" do
    assert_in_delta(nth_root(8, 3, 1), 2, tolerance())
    assert_in_delta(nth_root(16, 4, 2), 2, tolerance())
    assert_in_delta(nth_root(128, 7, 2), 2, tolerance())
    assert_in_delta(nth_root(256, 8, 3), 2, tolerance())
    assert_in_delta(nth_root(512, 9, 3), 2, tolerance())
    assert_in_delta(nth_root(32_768, 15, 3), 2, tolerance())
    assert_in_delta(nth_root(65_536, 16, 4), 2, tolerance())
  end

  @tag task: 145
  test "nth_root/2" do
    assert_in_delta(nth_root(8, 3), 2, tolerance())
    assert_in_delta(nth_root(16, 4), 2, tolerance())
    assert_in_delta(nth_root(128, 7), 2, tolerance())
    assert_in_delta(nth_root(256, 8), 2, tolerance())
    assert_in_delta(nth_root(512, 9), 2, tolerance())
    assert_in_delta(nth_root(32_768, 15), 2, tolerance())
    assert_in_delta(nth_root(65_536, 16), 2, tolerance())
  end
end
