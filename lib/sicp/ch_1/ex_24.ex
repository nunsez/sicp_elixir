defmodule SICP.Ch1.Ex24 do
  @moduledoc """
  Task:

  Modify the timed-prime-test procedure of Exercise 1.22 to use fast-prime? (the
  Fermat method), and test each of the 12 primes you found in that exercise.
  Since the Fermat test has Θ(logn) growth, how would you expect the time to test
  primes near 1,000,000 to compare with the time needed to test primes near 1000?
  Do your data bear this out? Can you explain any discrepancy you find?

  Answer:

  ```
  1_000
  --------------------
  1009 *** 466.18 ns -> 374.19 ns
  1013 *** 466.91 ns -> 376.00 ns
  1019 *** 467.85 ns -> 394.86 ns
  average: 466.98 -> 381.68
  speed up: 466.98 / 381.68 = 1.22
  ___________________

  10_000
  ___________________
  10007 *** 1.43 μs -> 0.43 μs
  10009 *** 1.42 μs -> 0.40 μs
  10037 *** 1.43 μs -> 0.43 μs
  average: 1.43 -> 0.42
  speed up: 1.43 / 0.42 = 3.4
  ___________________

  100_000
  ___________________
  100003 *** 4.47 μs -> 0.47 μs
  100019 *** 4.43 μs -> 0.48 μs
  100043 *** 4.45 μs -> 0.48 μs
  average: 4.45 -> 0.48
  speed up: 4.45 / 0.48 = 9.27
  ___________________

  1_000_000
  ___________________
  1000003 *** 13.82 μs -> 0.53 μs
  1000033 *** 14.15 μs -> 0.53 μs
  1000037 *** 14.07 μs -> 0.54 μs
  average: 14.01 -> 0.53
  speed up: 14.01 / 0.53 = 26.43
  ___________________
  ```

  Numbers around 1000 are calculated at about the same speed as in exercise 1.22.

  As the order of numbers increases, the calculation time decreases
  significantly.
  """

  import SICP.Common, only: [square: 1, remainder: 2, random: 1, even?: 1]

  @attempts 1

  @spec timed_prime_test(non_neg_integer()) :: boolean()
  def timed_prime_test(n) do
    result = :timer.tc(fn -> fast_prime?(n, @attempts) end, :nanosecond)

    case result do
      {elapsed_time, true} ->
        report_time(n, elapsed_time)
        true

      _ ->
        # we do not need non prime numbers in stdin, so skip the report
        false
    end
  end

  @spec report_time(non_neg_integer(), non_neg_integer()) :: :ok
  defp report_time(n, elapsed_time) do
    IO.puts("#{n} *** #{elapsed_time}µs")
  end

  @spec fast_prime?(pos_integer(), non_neg_integer()) :: boolean()
  def fast_prime?(n, times) do
    cond do
      times == 0 -> true
      fermat_test(n) -> fast_prime?(n, times - 1)
      true -> false
    end
  end

  @spec fermat_test(pos_integer()) :: boolean()
  defp fermat_test(n) do
    try_it(1 + random(n - 1), n)
  end

  @spec try_it(pos_integer(), pos_integer()) :: boolean()
  defp try_it(a, n) do
    expmod(a, n, n) == a
  end

  @spec expmod(pos_integer(), pos_integer(), pos_integer()) :: pos_integer()
  def expmod(base, exp, m) do
    cond do
      exp == 0 -> 1
      even?(exp) -> remainder(square(expmod(base, div(exp, 2), m)), m)
      true -> remainder(base * expmod(base, exp - 1, m), m)
    end
  end
end
