defmodule SICP.Ch1.Ex16 do
  @moduledoc """
  Task:

  Design a procedure that evolves an iterative exponentiation process that uses
  successive squaring and uses a logarithmic number of steps, as does fast-expt.

  (Hint: Using the observation that `(bⁿ୵²)² = (b²)ⁿ୵²`, keep, along with the
  exponent n and the base b, an additional state variable a, and define the state
  transformation in such a way that the product a bn is unchanged from state to
  state. At the beginning of the process a is taken to be 1, and the answer is
  given by the value of a at the end of the process. In general, the technique of
  defining an invariant quantity that remains unchanged from state to state is a
  powerful way to think about the design of iterative algorithms.)
  """

  @spec solution(non_neg_integer(), non_neg_integer()) :: non_neg_integer()
  def solution(number, exponent), do: fast_exp(number, exponent, 1)

  defguardp is_even(number) when rem(number, 2) == 0
  defguardp is_odd(number) when rem(number, 2) == 1

  @spec fast_exp(non_neg_integer(), non_neg_integer(), pos_integer()) :: non_neg_integer()
  defp fast_exp(number, exponent, product)

  defp fast_exp(_, 0, product), do: product

  defp fast_exp(number, exponent, product) when is_even(exponent) do
    fast_exp(number * number, div(exponent, 2), product)
  end

  defp fast_exp(number, exponent, product) when is_odd(exponent) do
    fast_exp(number, exponent - 1, product * number)
  end
end
