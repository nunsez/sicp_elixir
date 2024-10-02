defmodule SICP.Ch1.Ex31 do
  @moduledoc """
  Task:

  a. The `sum` procedure is only the simplest of a vast number of similar
  abstractions that can be captured as higher-order procedures. Write an
  analogous procedure called `product` that returns the product of the values of a
  function at points over a given range. Show how to define `factorial` in terms of
  `product`. Also use `product` to compute approximations to `π` using the formula

  ```
   π     2 · 4 · 4 · 6 · 6 · 8 ...
  --- = --------------------------.
   4     3 · 3 · 5 · 5 · 7 · 7 ...
  ```

  b. If your `product` procedure generates a recursive process, write one that
  generates an iterative process. If it generates an iterative process, write one
  that generates a recursive process.
  """

  import SICP.Common, only: [inc: 1, even?: 1]

  @spec factorial_rec(number()) :: number()
  def factorial_rec(n) do
    product_rec(&Function.identity/1, 1, &inc/1, n)
  end

  @spec product_rec((number() -> number()), number(), (number() -> number()), number()) ::
          number()
  def product_rec(term, a, next, b) do
    if a > b do
      1
    else
      term.(a) * product_rec(term, next.(a), next, b)
    end
  end

  @spec factorial_iter(number()) :: number()
  def factorial_iter(n) do
    product_iter(&Function.identity/1, 1, &inc/1, n)
  end

  @spec product_iter((number() -> number()), number(), (number() -> number()), number()) ::
          number()
  def product_iter(term, a, next, b) do
    iter(term, a, next, b, 1)
  end

  @spec iter((number() -> number()), number(), (number() -> number()), number(), number()) ::
          number()
  def iter(term, a, next, b, result) do
    if a > b do
      result
    else
      iter(term, next.(a), next, b, result * term.(a))
    end
  end

  @spec wallis_pi(integer()) :: number()
  def wallis_pi(n) do
    product_iter(&wallis_term/1, 1, &inc/1, n)
  end

  @spec wallis_term(integer()) :: number()
  def wallis_term(x) do
    if even?(x) do
      (x + 2) / (x + 1)
    else
      (x + 1) / (x + 2)
    end
  end
end
