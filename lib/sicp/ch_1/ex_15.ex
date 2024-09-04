defmodule SICP.Ch1.Ex15 do
  @moduledoc """
  Task:

  The sine of an angle (specified in radians) can be computed by making use of
  the approximation sin x x if x is sufficiently small, and the trigonometric
  identity

  ```
  sin(x) = 3sin(x / 3) − 4sin³(x / 3)
  ```

  to reduce the size of the argument of sin. (For purposes of this exercise an
  angle is considered ``sufficiently small'' if its magnitude is not greater than
  0.1 radians.) These ideas are incorporated in the following procedures:

  ```scheme
  (define (cube x) (* x x x))

  (define (p x) (- (* 3 x) (* 4 (cube x))))

  (define (sine angle)
    (if (not (> (abs angle) 0.1))
        angle
        (p (sine (/ angle 3.0)))))
  ```

  a. How many times is the procedure p applied when (sine 12.15) is evaluated?

  b. What is the order of growth in space and number of steps (as a function
  of a) used by the process generated by the sine procedure when (sine a) is
  evaluated?

  Answer:

  a. 5 times:
  1. 12.15 / 3  ==  4.05  >  0.1
  2.  4.05 / 3  ==  1.35  >  0.1
  3.  1.35 / 3  ==  0.45  >  0.1
  4.  0.45 / 3  ==  0.15  >  0.1
  5.  0.15 / 3  ==  0.05  <= 0.1

  b. Orders of growth

    Steps:
      approximately O(log3(n)) because angle is decreases by a factor of 3 with each step

    Space:
      the same as the step count, because of recursion
  """

  @spec sine(number()) :: number()
  def sine(angle) when abs(angle) > 0.1, do: p(sine(angle / 3.0))
  def sine(angle), do: angle

  @spec cube(number()) :: number()
  defp cube(x), do: x * x * x

  @spec p(number()) :: number()
  defp p(x), do: 3 * x - 4 * cube(x)
end
