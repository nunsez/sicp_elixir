defmodule Sicp.Ch1.S3.Ex30 do
  @moduledoc """
  Task:

  The sum procedure above generates a linear recursion. The procedure can be
  rewritten so that the sum is performed iteratively. Show how to do this by
  filling in the missing expressions in the following definition:

  ```scheme
  (define (sum term a next b)
    (define (iter a result)
      (if ⟨??⟩
          ⟨??⟩
          (iter ⟨??⟩ ⟨??⟩)))
    (iter ⟨??⟩ ⟨??⟩))
  ```

  Answer:

  ```scheme
  (define (sum term a next b)
    (define (iter a result)
      (if (> a b)
          result
          (iter (next a) (+ result (term a)))))
    (iter a 0))
  ```
  """

  @spec sum((number() -> number()), number(), (number() -> number()), number()) :: number()
  def sum(term, a, next, b) do
    iter(term, a, next, b, 0)
  end

  @spec iter((number() -> number()), number(), (number() -> number()), number(), number()) ::
          number()
  def iter(term, a, next, b, result) do
    if a > b do
      result
    else
      iter(term, next.(a), next, b, result + term.(a))
    end
  end
end
