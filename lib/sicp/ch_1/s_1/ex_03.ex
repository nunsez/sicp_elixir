defmodule Sicp.Ch1.S1.Ex03 do
  @moduledoc """
  Task:

  Define a procedure that takes three numbers as arguments and returns the sum of
  the squares of the two larger numbers.
  """

  @spec solution(number(), number(), number()) :: number()
  def solution(a, b, c) do
    cond do
      a <= b and a <= c -> sum_of_squares(b, c)
      b <= a and b <= c -> sum_of_squares(a, c)
      c <= a and c <= b -> sum_of_squares(a, b)
      true -> raise "Unexpected condition clause"
    end
  end

  @spec sum_of_squares(number(), number()) :: number()
  defp sum_of_squares(x, y), do: square(x) + square(y)

  @spec square(number()) :: number()
  defp square(x), do: x * x
end
