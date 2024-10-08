defmodule Sicp.Ch1.S3.Ex36 do
  @moduledoc """
  Task:

  Modify `fixed-point` so that it prints the sequence of approximations it
  generates, using the `newline` and `display` primitives shown in Exercise 1.22.
  Then find a solution to `xˣ = 1000` by finding a fixed point of

  `x 7 |-> log(1000)/log(x)`. (Use Scheme’s primitive `log` procedure, which computes
  natural logarithms.) Compare the number of steps this takes with and without
  average damping. (Note that you cannot start `fixed-point` with a guess of `1`, as
  this would cause division by `log(1) = 0`.)
  """

  import Sicp.Ch1.S3, only: [close_enough?: 2]
  import Sicp.Common, only: [average: 2]

  @spec with_damping(number()) :: number()
  def with_damping(first_guess) do
    f = fn x -> average(x, :math.log(1000) / :math.log(x)) end
    fixed_point(f, first_guess)
  end

  @spec without_damping(number()) :: number()
  def without_damping(first_guess) do
    f = fn x -> :math.log(1000) / :math.log(x) end
    fixed_point(f, first_guess)
  end

  @spec fixed_point((number() -> number()), number()) :: number()
  def fixed_point(f, first_guess) do
    try1(f, first_guess)
  end

  @spec try1((number() -> number()), number()) :: number()
  def try1(f, guess) do
    # credo:disable-for-next-line Credo.Check.Warning.IoInspect
    IO.inspect(guess, label: "guess")
    next = f.(guess)

    if close_enough?(guess, next) do
      next
    else
      try1(f, next)
    end
  end
end
