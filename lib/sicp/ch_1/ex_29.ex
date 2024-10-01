defmodule SICP.Ch1.Ex29 do
  @moduledoc """
  Task:

  Simpson’s Rule is a more accurate method of numerical integration than the
  method illustrated above. Using Simpson’s Rule, the integral of a function `f`
  between `a` and `b` is approximated as

  ```
   h
  ---(y0 + 4y1 + 2y2 + 4y3 + 2y4 + ... + 2yn−2 + 4yn−1 + yn),
   3
  ```

  where `h = (b − a)/n`, for some even integer n, and `yk = f(a + kh)`. (Increasing `n`
  increases the accuracy of the approximation.) Define a procedure that takes as
  arguments `f`, `a`, `b`, and `n` and returns the value of the integral, computed using
  Simpson’s Rule.

  Use your procedure to integrate cube between `0` and `1`
  (with `n = 100` and `n = 1000`), and compare the results to those of the integral
  procedure shown above.
  """

  import SICP.Common, only: [odd?: 1, even?: 1, inc: 1]

  @spec integral((number() -> number()), integer(), integer(), float()) :: number()
  def integral(f, a, b, dx) do
    add_dx = fn x -> x + dx end
    dx * sum(f, a + dx / 2, add_dx, b)
  end

  @spec simpsons_rule(integer(), integer(), integer(), integer()) :: number()
  def simpsons_rule(f, a, b, n) do
    h = (b - a) / n
    yk = fn k -> f.(a + k * h) end

    term = fn k ->
      cond do
        odd?(k) -> 4
        k == 0 or k == n -> 1
        even?(k) -> 2
      end * yk.(k)
    end

    h / 3 * sum(term, 0, &inc/1, n)
  end

  @spec sum((number() -> number()), number(), (number() -> number()), number()) :: number()
  def sum(term, a, next, b) do
    if a > b do
      0
    else
      term.(a) + sum(term, next.(a), next, b)
    end
  end
end
