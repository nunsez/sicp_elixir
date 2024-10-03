defmodule Sicp.Ch1.S2.Ex22 do
  @moduledoc """
  Task:

  Most Lisp implementations include a primitive called runtime that returns an
  integer that specifies the amount of time the system has been running
  (measured, for example, in microseconds). The following `timed-prime-test`
  procedure, when called with an integer `n`, prints `n` and checks to see if `n` is
  prime. If `n` is prime, the procedure prints three asterisks followed by the
  amount of time used in performing the test.

  ```scheme
  (define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime)))

  (define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime (- (runtime) start-time))))

  (define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))
  ```

  Answer:

  ```
  1_000
  --------------------
  1009 *** 473.03 ns
  1013 *** 475.82 ns
  1019 *** 476.40 ns
  average: 474.89 ns
  ___________________

  10_000
  ___________________
  10007 *** 1.47 μs
  10009 *** 1.46 μs
  10037 *** 1.45 μs
  average: 1.46 μs
  growth: 1.46 / 0.47489 = 3.07
  ___________________

  100_000
  ___________________
  100003 *** 4.50 μs
  100019 *** 4.50 μs
  100043 *** 4.48 μs
  average: 4.49 μs
  growth: 4.49 / 1.46 = 3.08
  ___________________

  1_000_000
  ___________________
  1000003 *** 14.09 μs
  1000033 *** 14.07 μs
  1000037 *** 14.37 μs
  average: 14.18 μs
  growth: 14.18 / 4.49 = 3.16
  ___________________
  ```

  Big numbers:

  ```
  100_000_000
  ___________________
  100000007 *** 144.95 μs
  ___________________

  1_000_000_000
  ___________________
  1000000007 *** 456.98 μs
  growth: 456.98 / 144.95 = 3.15
  ___________________
  ```
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
  defp timed_prime_test(n) do
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
      true -> find_divisor(n, test_divisor + 1)
    end
  end

  @spec square(number()) :: number()
  defp square(x), do: x * x

  @spec divides?(pos_integer(), non_neg_integer()) :: boolean()
  defp divides?(a, b), do: rem(b, a) == 0
end
