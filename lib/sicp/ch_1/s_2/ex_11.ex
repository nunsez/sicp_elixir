defmodule Sicp.Ch1.S2.Ex11 do
  @moduledoc """
  Task:

  A function f is defined by the rule that

  ```
  f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3.
  ```

  Write a procedure that computes f by means of a recursive process. Write a
  procedure that computes f by means of an iterative process.
  """

  @doc """
  Recursive process.
  """
  @spec f(integer()) :: integer()
  def f(n) when n < 3, do: n

  def f(n) do
    f(n - 1) + 2 * f(n - 2) + 3 * f(n - 3)
  end

  @doc """
  Iterative process.
  """
  @spec f_iter(integer()) :: integer()
  def f_iter(n), do: f_iter_do(2, 1, 0, n)

  @spec f_iter_do(integer(), integer(), integer(), integer()) :: integer()
  defp f_iter_do(_, _, _, count) when count < 0, do: count
  defp f_iter_do(_, _, f1, 0), do: f1

  defp f_iter_do(f3, f2, f1, count) do
    # Compute new f3 and make offset for f2 and f3.
    new_f1 = f2
    new_f2 = f3
    new_f3 = 1 * f3 + 2 * f2 + 3 * f1

    f_iter_do(new_f3, new_f2, new_f1, count - 1)
  end
end
