defmodule Sicp.Ch1.S2.Ex18 do
  @moduledoc """
  Task:

  Using the results of exercises 1.16 and 1.17, devise a procedure that generates
  an iterative process for multiplying two integers in terms of adding, doubling,
  and halving and uses a logarithmic number of steps.
  """

  import Bitwise, only: [&&&: 2, <<<: 2, >>>: 2]

  defguardp is_even(integer) when is_integer(integer) and (integer &&& 0b1) == 0

  @spec mul_iter(pos_integer(), non_neg_integer()) :: non_neg_integer()
  def mul_iter(number, multiplier) do
    mul_iter(number, multiplier, 0)
  end

  @spec mul_iter(pos_integer(), non_neg_integer(), non_neg_integer()) :: non_neg_integer()
  def mul_iter(number, multiplier, sum)

  def mul_iter(_, 0, _), do: 0
  def mul_iter(number, 1, sum), do: number + sum

  def mul_iter(number, multiplier, sum) when is_even(multiplier) do
    mul_iter(double(number), halve(multiplier), sum)
  end

  def mul_iter(number, multiplier, sum) when not is_even(multiplier) do
    mul_iter(double(number), halve(multiplier - 1), sum + number)
  end

  @spec double(integer()) :: integer()
  defp double(integer), do: integer <<< 1

  @spec halve(integer()) :: integer()
  defp halve(integer) when is_even(integer), do: integer >>> 1
end
