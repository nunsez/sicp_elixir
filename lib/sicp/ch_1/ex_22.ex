defmodule SICP.Ch1.Ex22 do
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
  1009 *** 55µs
  1013 *** 49µs
  1019 *** 56µs
  average: 53.33
  ___________________

  10_000
  ___________________
  10007 *** 697µs
  10009 *** 509µs
  10037 *** 512µs
  average: 572.66
  growth: 572.66 / 53.33 = 10.73
  ___________________

  100_000
  ___________________
  100003 *** 4868µs
  100019 *** 4919µs
  100043 *** 4813µs
  average: 4866.66
  growth: 4866.66 / 572.66 = 8.49
  ___________________

  1_000_000
  ___________________
  1000003 *** 35359µs
  1000033 *** 36395µs
  1000037 *** 36517µs
  average: 36090.33
  growth: 36090.33 / 4866.66 = 7.41
  ___________________
  ```

  Big numbers:

  ```
  100_000_000
  ___________________
  100000007 *** 3723325µs
  ___________________

  1_000_000_000
  ___________________
  1000000007 *** 36530511µs
  growth: 36530511 / 3723325 = 9.81
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
    result = :timer.tc(fn -> prime?(n) end)

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
  defp prime?(n), do: smallest_divisor(n) == n

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

  @spec square(non_neg_integer()) :: float()
  defp square(n) when n >= 0, do: :math.sqrt(n)

  @spec divides?(pos_integer(), non_neg_integer()) :: boolean()
  defp divides?(a, b), do: rem(b, a) == 0
end
