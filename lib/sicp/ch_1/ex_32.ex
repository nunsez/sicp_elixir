defmodule SICP.Ch1.Ex32 do
  @moduledoc """
  Task:

  a. Show that `sum` and `product` (Exercise 1.31) are both special cases of a still
  more general notion called `accumulate` that combines a collection of terms,
  using some general accumulation function:

  ```scheme
  (accumulate combiner null-value term a next b)
  ```

  `accumulate` takes as arguments the same term and range specifications as `sum` and
  `product`, together with a `combiner` procedure (of two arguments) that specifies
  how the current term is to be combined with the accumulation of the preceding
  terms and a `null-value` that specifies what base value to use when the terms run
  out. Write `accumulate` and show how `sum` and `product` can both be defined as
  simple calls to `accumulate`.

  b. If your `accumulate` procedure generates a recursive process, write one that
  generates an iterative process. If it generates an iterative process, write one
  that generates a recursive process.
  """

  @spec accumulate_iter(
          (number(), number() -> number()),
          number(),
          (number() -> number()),
          number(),
          (number() -> number()),
          number()
        ) :: number()
  def accumulate_iter(combiner, null_value, term, a, next, b) do
    if a > b do
      null_value
    else
      accumulate_iter(combiner, combiner.(term.(a), null_value), term, next.(a), next, b)
    end
  end

  @spec accumulate_rec(
          (number(), number() -> number()),
          number(),
          (number() -> number()),
          number(),
          (number() -> number()),
          number()
        ) :: number()
  def accumulate_rec(combiner, null_value, term, a, next, b) do
    if a > b do
      null_value
    else
      combiner.(term.(a), accumulate_rec(combiner, null_value, term, next.(a), next, b))
    end
  end

  @spec sum((number() -> number()), number(), (number() -> number()), number()) :: number()
  def sum(term, a, next, b) do
    combiner = &Kernel.+/2
    accumulate_rec(combiner, 0, term, a, next, b)
  end

  @spec product((number() -> number()), number(), (number() -> number()), number()) :: number()
  def product(term, a, next, b) do
    combiner = &Kernel.*/2
    accumulate_iter(combiner, 1, term, a, next, b)
  end
end
