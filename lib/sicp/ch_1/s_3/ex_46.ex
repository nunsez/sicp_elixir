defmodule Sicp.Ch1.S3.Ex46 do
  @moduledoc """
  Task:

  Several of the numerical methods described in this chapter are instances of an
  extremely general computational strategy known as `iterative improvement`.
  Iterative improvement says that, to compute something, we start with an initial
  guess for the answer, test if the guess is good enough, and otherwise improve
  the guess and continue the process using the improved guess as the new guess.
  Write a procedure `iterative-improve` that takes two procedures as arguments: a
  method for telling whether a guess is good enough and a method for improving a
  guess. `iterative-improve` should return as its value a procedure that takes a
  guess as argument and keeps improving the guess until it is good enough.
  Rewrite the `sqrt` procedure of Section 1.1.7 and the `fixed-point` procedure of
  Section 1.3.3 in terms of `iterative-improve`.
  """

  import Sicp.Common, only: [square: 1, average: 2]

  @spec iterative_improve((number() -> boolean()), (number() -> number())) ::
          (number() -> number())
  def iterative_improve(good_enough?, improve) do
    fn guess -> iterative_improve(good_enough?, improve, guess) end
  end

  @spec iterative_improve((number() -> boolean()), (number() -> number()), number()) ::
          number()
  def iterative_improve(good_enough?, improve, guess) do
    if good_enough?.(guess) do
      guess
    else
      improved_guess = improve.(guess)
      iterative_improve(good_enough?, improve, improved_guess)
    end
  end

  @spec sqrt(number()) :: number()
  def sqrt(x) do
    good_enough? = fn guess -> abs(x - square(guess)) < tolerance() end
    improve = fn guess -> average(guess, x / guess) end
    result_func = iterative_improve(good_enough?, improve)
    result_func.(1)
  end

  @spec fixed_point((number() -> number()), number(), number()) :: number()
  def fixed_point(f, initial_guess, tolerance \\ tolerance()) do
    good_enough? = fn guess -> abs(guess - f.(guess)) < tolerance end
    improve = fn guess -> f.(guess) end
    result_func = iterative_improve(good_enough?, improve)
    result_func.(initial_guess)
  end

  @spec tolerance() :: float()
  def tolerance do
    0.00001
  end
end
