defmodule Sicp.Ch1.S3.Ex33 do
  @moduledoc """
  Task:

  You can obtain an even more general version of accumulate (Exercise 1.32) by introducing the notion of a `filter` on
  the terms to be combined. That is, combine
  only those terms derived from values in the range that satisfy a specified condition.e resulting `filtered-accumulate`
  abstraction takes the same arguments as accumulate, together with an additional predicate of one argument that
  specifies the filter. Write `filtered-accumulate` as a procedure. Show how to express the following using `filtered-accumulate`:

  a. the sum of the squares of the prime numbers in the
  interval `a` to `b` (assuming that you have a `prime?` predicate already written)

  b. the product of all the positive integers less than `n` that
  are relatively prime to `n` (i.e., all positive integers `i < n`
  such that `GCD(i, n) = 1`).
  """

  alias Sicp.Ch1.S2.Ex28

  import Sicp.Common, only: [inc: 1, square: 1]

  @spec filtered_accumulate(
          (number(), number() -> number()),
          number(),
          (number() -> number()),
          number(),
          (number() -> number()),
          number(),
          (number() -> boolean())
        ) :: number()
  def filtered_accumulate(combiner, null_value, term, a, next, b, filter?) do
    cond do
      a > b ->
        null_value

      filter?.(a) ->
        combiner.(
          term.(a),
          filtered_accumulate(combiner, null_value, term, next.(a), next, b, filter?)
        )

      true ->
        combiner.(
          null_value,
          filtered_accumulate(combiner, null_value, term, next.(a), next, b, filter?)
        )
    end
  end

  @spec sum_prime_squares(integer(), integer()) :: integer()
  def sum_prime_squares(a, b) do
    combiner = &Kernel.+/2
    term = &square/1
    next = &inc/1
    filter? = &prime?/1
    filtered_accumulate(combiner, 0, term, a, next, b, filter?)
  end

  @spec prime?(integer()) :: boolean()
  def prime?(n) when n < 2 do
    false
  end

  def prime?(n) do
    Ex28.fast_prime?(n, 5)
  end

  @spec product_relative_primes(integer()) :: integer()
  def product_relative_primes(n) do
    combiner = &Kernel.*/2
    term = &Function.identity/1
    next = &inc/1
    filter? = fn x -> Integer.gcd(x, n) == 1 end
    filtered_accumulate(combiner, 1, term, 1, next, n, filter?)
  end
end
