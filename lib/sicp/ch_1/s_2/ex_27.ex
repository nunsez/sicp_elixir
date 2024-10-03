defmodule Sicp.Ch1.S2.Ex27 do
  @moduledoc """
  Task:

  Demonstrate that the Carmichael numbers listed in Footnote 1.47 really do fool
  the Fermat test. That is, write a procedure that takes an integer `n` and tests
  whether `aⁿ` is congruent to a modulo `n` for every `a < n`, and try your procedure
  on the given Carmichael numbers.
  """

  @spec fermat_test(pos_integer()) :: boolean()
  defdelegate fermat_test(n), to: Sicp.Ch1.S2.Ex24

  @spec expmod(pos_integer(), pos_integer(), pos_integer()) :: pos_integer()
  defdelegate expmod(base, exp, m), to: Sicp.Ch1.S2.Ex24

  @spec check(pos_integer()) :: boolean()
  def check(n), do: check_iter(n, n - 1)

  @spec check_iter(pos_integer(), non_neg_integer()) :: boolean()
  defp check_iter(n, a) do
    cond do
      a == 0 -> true
      expmod(a, n, n) == a -> check_iter(n, a - 1)
      true -> false
    end
  end
end
