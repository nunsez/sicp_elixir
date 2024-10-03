defmodule Sicp.Ch1.S2.Ex17 do
  @moduledoc """
  Task:

  The exponentiation algorithms in this section are based on performing
  exponentiation by means of repeated multiplication. In a similar way, one can
  perform integer multiplication by means of repeated addition. The following
  multiplication procedure (in which it is assumed that our language can only
  add, not multiply) is analogous to the expt procedure:

  ```scheme
  (define (* a b)
    (if (= b 0)
        0
        (+ a (* a (- b 1)))))
  ```

  This algorithm takes a number of steps that is linear in b. Now suppose we
  include, together with addition, operations double, which doubles an integer,
  and halve, which divides an (even) integer by 2. Using these, design a
  multiplication procedure analogous to fast-expt that uses a logarithmic number
  of steps.
  """

  import Bitwise, only: [&&&: 2, <<<: 2, >>>: 2]

  defguardp is_even(integer) when is_integer(integer) and (integer &&& 0b1) == 0

  @spec fast_mul(pos_integer(), non_neg_integer()) :: non_neg_integer()
  def fast_mul(number, multiplier)

  def fast_mul(_, 0), do: 0
  def fast_mul(number, 1), do: number

  def fast_mul(number, multiplier) when is_even(multiplier) do
    fast_mul(double(number), halve(multiplier))
  end

  def fast_mul(number, multiplier) when not is_even(multiplier) do
    number + fast_mul(double(number), halve(multiplier - 1))
  end

  @spec double(integer()) :: integer()
  defp double(integer), do: integer <<< 1

  @spec halve(integer()) :: integer()
  defp halve(integer) when is_even(integer), do: integer >>> 1
end
