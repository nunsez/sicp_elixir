defmodule SICP.Ch1.Ex23 do
  @moduledoc """
  Task:

  The `smallest-divisor` procedure shown at the start of this section does lots of
  needless testing: After it checks to see if the number is divisible by 2 there
  is no point in checking to see if it is divisible by any larger even numbers.
  This suggests that the values used for `test-divisor` should not be 2, 3, 4, 5,
  6, ..., but rather 2, 3, 5, 7, 9, ...

  To implement this change, define a procedure next that returns 3 if its input
  is equal to 2 and otherwise returns its input plus 2. Modify the
  `smallest-divisor` procedure to use `(next test-divisor)` instead of
  `(+ test-divisor 1)`.

  With timed-prime-test incorporating this modified version of `smallest-divisor`,
  run the test for each of the 12 primes found in Exercise 1.22. Since this
  modification halves the number of test steps, you should expect it to run about
  twice as fast. Is this expectation confirmed? If not, what is the observed
  ratio of the speeds of the two algorithms, and how do you explain the fact that
  it is different from 2?

  Answer:

  ```
  1_000
  --------------------
  1009 *** 473.72 ns -> 298.01 ns
  1013 *** 467.63 ns -> 289.10 ns
  1019 *** 469.37 ns -> 289.55 ns
  average: 470.24 -> 292.22
  speed up: 470.24 / 292.22 = 1.61
  ___________________

  10_000
  ___________________
  10007 *** 1.44 μs -> 0.80 μs
  10009 *** 1.43 μs -> 0.80 μs
  10037 *** 1.45 μs -> 0.80 μs
  average: 1.44 -> 0.80
  speed up: 1.44 / 0.80 = 1.8
  ___________________

  100_000
  ___________________
  100003 *** 4.57 μs -> 2.44 μs
  100019 *** 4.52 μs -> 2.42 μs
  100043 *** 4.50 μs -> 2.45 μs
  average: 4.53 -> 2.44
  speed up: 4.53 / 2.44 = 1.86
  ___________________

  1_000_000
  ___________________
  1000003 *** 14.49 μs -> 7.60 μs
  1000033 *** 14.18 μs -> 7.67 μs
  1000037 *** 14.05 μs -> 7.59 μs
  average: 14.24 -> 7.62
  speed up: 14.24 / 7.62 = 1.87
  ___________________
  ```

  The speed up is not 2 times, but close to it. This can be explained by the fact
  that in procedure find_divisor not only calls to procedure find_divisor occur,
  but also to other procedures (square, divides?), which slightly reduces the
  degree of speed up.

  As the order of numbers increases, the speed up remains practically unchanged.
  """

  @prime_numbers_max_count 3

  @spec search_for_primes(non_neg_integer()) :: :ok
  def search_for_primes(number) do
    search_for_primes(number, 0)
  end

  @spec search_for_primes(non_neg_integer(), non_neg_integer()) :: :ok
  defp search_for_primes(_, @prime_numbers_max_count), do: :ok

  defp search_for_primes(number, count) do
    case timed_prime_test(number) do
      true -> search_for_primes(number + 1, count + 1)
      _ -> search_for_primes(number + 1, count)
    end
  end

  @spec timed_prime_test(non_neg_integer()) :: boolean()
  def timed_prime_test(n) do
    result = :timer.tc(fn -> prime?(n) end, :nanosecond)

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

  @spec prime?(non_neg_integer()) :: boolean()
  def prime?(n), do: smallest_divisor(n) == n

  @spec smallest_divisor(non_neg_integer()) :: integer()
  defp smallest_divisor(n), do: find_divisor(n, 2)

  @spec find_divisor(non_neg_integer(), pos_integer()) :: pos_integer()
  defp find_divisor(n, test_divisor) do
    cond do
      square(test_divisor) > n -> n
      divides?(test_divisor, n) -> test_divisor
      true -> find_divisor(n, next(test_divisor))
    end
  end

  @spec square(number()) :: number()
  defp square(x), do: x * x

  @spec divides?(pos_integer(), non_neg_integer()) :: boolean()
  defp divides?(a, b), do: rem(b, a) == 0

  @spec next(pos_integer()) :: pos_integer()
  defp next(2), do: 3
  defp next(test_divisor), do: test_divisor + 2
end
