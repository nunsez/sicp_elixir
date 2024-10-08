defmodule Sicp.Ch1.S3.Ex36Test do
  use ExUnit.Case
  doctest Sicp.Ch1.S3.Ex36

  import ExUnit.CaptureIO
  import Sicp.Ch1.S3, only: [tolerance: 0]
  import Sicp.Ch1.S3.Ex36, only: [without_damping: 1, with_damping: 1]

  @first_guess 3

  @tag task: 136
  test "equality" do
    capture_io(fn ->
      assert_in_delta(without_damping(@first_guess), with_damping(@first_guess), tolerance())
    end)
  end

  @tag task: 136
  test "without average damping" do
    fn -> without_damping(@first_guess) end
    |> capture_io()
    |> print_count("without average damping count")
  end

  @tag task: 136
  test "with average damping" do
    fn -> with_damping(@first_guess) end
    |> capture_io()
    |> print_count("with average damping count")
  end

  @spec print_count(String.t(), String.t()) :: String.t()
  def print_count(out, label) do
    out
    |> String.split("\n")
    |> Enum.count()
    # credo:disable-for-next-line Credo.Check.Warning.IoInspect
    |> IO.inspect(label: label)
  end
end
