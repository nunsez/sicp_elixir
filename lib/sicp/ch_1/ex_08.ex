defmodule SICP.Ch1.Ex08 do
  @moduledoc """
  Task:

  Newton's method for cube roots is based on the fact that if y is an
  approximation to the cube root of x, then a better approximation is given by
  the value

  ```
  x/(y * y) + 2y
  --------------
        3
  ```

  Use this formula to implement a cube-root procedure analogous to the
  square-root procedure. (In section 1.3.4 we will see how to implement Newton's
  method in general as an abstraction of these square-root and cube-root
  procedures.)
  """

  @spec cube_root(number()) :: float()
  def cube_root(x), do: cube_iter(1.0, x)

  @spec cube_iter(float(), number()) :: float()
  defp cube_iter(guess, x) do
    improved_guess = improve(guess, x)

    if good_enough?(improved_guess, guess) do
      guess
    else
      cube_iter(improved_guess, x)
    end
  end

  @delta 1.0e-7

  @spec good_enough?(number(), number()) :: boolean()
  defp good_enough?(improved_guess, guess) do
    abs(guess - improved_guess) < @delta
  end

  @spec improve(float(), number()) :: float()
  defp improve(guess, x) do
    (x / (guess * guess) + 2 * guess) / 3
  end
end
