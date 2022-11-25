defmodule SICP.Ch1.Ex07 do
  @moduledoc """
  Task:

  The good-enough? test used in computing square roots will not be very effective
  for finding the square roots of very small numbers. Also, in real computers,
  arithmetic operations are almost always performed with limited precision. This
  makes our test inadequate for very large numbers. Explain these statements,
  with examples showing how the test fails for small and large numbers. An
  alternative strategy for implementing good-enough? is to watch how guess
  changes from one iteration to the next and to stop when the change is a very
  small fraction of the guess. Design a square-root procedure that uses this kind
  of end test. Does this work better for small and large numbers?
  """

  @spec square_root(number()) :: float()
  def square_root(x), do: sqrt_iter(1.0, x)

  @spec sqrt_iter(float(), number()) :: float()
  defp sqrt_iter(guess, x) do
    improved_guess = improve(guess, x)

    if good_enough?(improved_guess, guess) do
      guess
    else
      sqrt_iter(improved_guess, x)
    end
  end

  @delta 1.0e-7

  @spec good_enough?(number(), number()) :: boolean()
  defp good_enough?(improved_guess, guess) do
    abs(guess - improved_guess) < @delta
  end

  @spec improve(float(), number()) :: float()
  defp improve(guess, x), do: average(guess, x / guess)

  @spec average(float(), number()) :: float()
  defp average(x, y), do: (x + y) / 2
end
