defmodule SICP.Ch1.Ex28 do
  @moduledoc """
  Task:

  One variant of the Fermat test that cannot be fooled is called the Miller-Rabin
  test (Miller 1976; Rabin 1980). This starts from an alternate form of Fermat’s
  Little theorem, which states that if `n` is a prime number and `a` is any positive
  integer less than `n`, then `a` raised to the `(n−1)`-st power is congruent to `1`
  modulo `n`. To test the primality of a number `n` by the Miller-Rabin test, we pick
  a random number `a < n` and raise a to the `(n −1)`-st power modulo `n` using the
  `expmod` procedure. However, whenever we perform the squaring step in `expmod`, we
  check to see if we have discovered a “nontrivial square root of 1 modulo `n`,”
  that is, a number not equal to `1` or `n−1` whose square is equal to `1` modulo `n`. It
  is possible to prove that if such a nontrivial square root of `1` exists, then `n`
  is not prime. It is also possible to prove that if `n` is an odd number that is
  not prime, then, for at least half the numbers `a < n`, computing a `n−1` in this
  way will reveal a nontrivial square root of `1` modulo `n`. (This is why the
  Miller-Rabin test cannot be fooled.) Modify the `expmod` procedure to signal if
  it discovers a nontrivial square root of `1`, and use this to implement the
  Miller-Rabin test with a procedure analogous to `fermat-test`. Check your
  procedure by testing various known primes and non-primes. Hint: One convenient
  way to make expmod signal is to have it return `0`.
  """

  import SICP.Common, only: [even?: 1, remainder: 2, square: 1, random: 1]

  @spec fast_prime?(pos_integer(), non_neg_integer()) :: boolean()
  def fast_prime?(n, times) do
    cond do
      times == 0 -> true
      miller_rabin_test(n) -> fast_prime?(n, times - 1)
      true -> false
    end
  end

  @spec miller_rabin_test(pos_integer()) :: boolean()
  def miller_rabin_test(n) do
    try_it(1 + random(n - 1), n)
  end

  @spec try_it(pos_integer(), pos_integer()) :: boolean()
  defp try_it(a, n) do
    expmod(a, n - 1, n) == 1
  end

  @spec expmod(pos_integer(), pos_integer(), pos_integer()) :: non_neg_integer()
  defp expmod(base, exp, m) do
    cond do
      exp == 0 -> 1
      even?(exp) -> remainder(check_square(expmod(base, div(exp, 2), m), m), m)
      true -> remainder(base * expmod(base, exp - 1, m), m)
    end
  end

  @spec check_square(non_neg_integer(), pos_integer()) :: non_neg_integer()
  defp check_square(n, m) do
    if n != 1 and n != m - 1 and remainder(square(n), m) == 1 do
      0
    else
      remainder(square(n), m)
    end
  end
end
