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
  1009 *** 55µs -> 28µs
  1013 *** 49µs -> 29µs
  1019 *** 56µs -> 28µs
  average: 53.33 -> 28.33
  speed up: 53.33 / 28.33 = 1.88
  ___________________

  10_000
  ___________________
  10007 *** 697µs -> 253µs
  10009 *** 509µs -> 238µs
  10037 *** 512µs -> 234µs
  average: 572.66 -> 241.66
  speed up: 572.66 / 241.66 = 2.37
  ___________________

  100_000
  ___________________
  100003 *** 4868µs -> 1815µs
  100019 *** 4919µs -> 1829µs
  100043 *** 4813µs -> 2045µs
  average: 4866.66 -> 1896.33
  speed up: 4866.66 / 1896.33 = 2.57
  ___________________

  1_000_000
  ___________________
  1000003 *** 35359µs -> 17795µs
  1000033 *** 36395µs -> 17901µs
  1000037 *** 36517µs -> 17927µs
  average: 36090.33 -> 17874.33
  speed up: 36090.33 / 17874.33 = 2.02
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
  def timed_prime_test(n) do
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
      true -> find_divisor(n, next(test_divisor))
    end
  end

  @spec square(non_neg_integer()) :: float()
  defp square(n) when n >= 0, do: :math.sqrt(n)

  @spec divides?(pos_integer(), non_neg_integer()) :: boolean()
  defp divides?(a, b), do: rem(b, a) == 0

  @spec next(pos_integer()) :: pos_integer()
  defp next(2), do: 3
  defp next(test_divisor), do: test_divisor + 2
end
