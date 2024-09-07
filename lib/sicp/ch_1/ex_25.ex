defmodule SICP.Ch1.Ex25 do
  @moduledoc """

  Task:
  Alyssa P. Hacker complains that we went to
  a lot of extra work in writing expmod. Afer all, she says,
  since we already know how to compute exponentials, we
  could have simply written

  ```scheme
  (define (expmod base exp m)
    (remainder (fast-expt base exp) m))
  ```

  Is she correct? Would this procedure serve as well for our
  fast prime tester? Explain.

  Answer:

  Both implementations perform accurately, though their execution methods differ
  significantly.

  Procedure fast_expt requires calculating the entire exponentiation before
  finding its modulus, resulting in extremely large intermediary results that
  consume substantial computational resources.

  In contrast, the initial approach continuously squares the exponent and finds
  its modulus without exceeding the predefined maximum size, thereby reducing
  both memory usage and computational complexity compared to handling large
  intermediate values.
  """

  import SICP.Common, only: [remainder: 2, even?: 1, square: 1, random: 1, halve: 1]

  @spec fast_prime?(pos_integer(), non_neg_integer()) :: boolean()
  def fast_prime?(n, times) do
    cond do
      times == 0 -> true
      fermat_test(n) -> fast_prime?(n, times - 1)
      true -> false
    end
  end

  @spec fermat_test(pos_integer()) :: boolean()
  def fermat_test(n) do
    try_it(1 + random(n - 1), n)
  end

  @spec try_it(pos_integer(), pos_integer()) :: boolean()
  def try_it(a, n) do
    expmod(a, n, n) == a
  end

  @spec expmod(pos_integer(), pos_integer(), pos_integer()) :: pos_integer()
  def expmod(base, exp, m) do
    remainder(fast_expt(base, exp), m)
  end

  @spec fast_expt(integer(), non_neg_integer()) :: number()
  def fast_expt(b, n) do
    cond do
      n == 0 -> 1
      even?(n) -> square(fast_expt(b, halve(n)))
      true -> b * fast_expt(b, n - 1)
    end
  end
end
