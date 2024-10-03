defmodule Sicp.Ch1.S2.Ex19 do
  @moduledoc """
  Task:

  There is a clever algorithm for computing the Fibonacci numbers in a
  logarithmic number of steps. Recall the transformation of the state variables `a`
  and `b` in the fib-iter process of section 1.2.2: `a ← a + b` and `b ← a`. Call this
  transformation `T`, and observe that applying `T` over and over again n times,
  starting with 1 and 0, produces the pair `Fib(n + 1)` and `Fib(n)`. In other words,
  the Fibonacci numbers are produced by applying `Tⁿ`, the nth power of the
  transformation `T`, starting with the pair `(1,0)`. Now consider `T` to be the
  special case of `p = 0` and `q = 1` in a family of transformations `Tpq`, where `Tpq`
  transforms the pair `(a,b)` according to `a ← bq + aq + ap` and `b ← bp + aq`. Show
  that if we apply such a transformation `Tpq` twice, the effect is the same as
  using a single transformation `Tp′q′` of the same form, and compute `p′` and `q′` in
  terms of `p` and `q`. This gives us an explicit way to square these
  transformations, and thus we can compute `Tⁿ` using successive squaring, as in
  the `fast-expt` procedure. Put this all together to complete the following
  procedure, which runs in a logarithmic number of steps:

  ```scheme
  (define (fib n)
    (fib-iter 1 0 0 1 n))

  (define (fib-iter a b p q count)
    (cond ((= count 0) b)
          ((even? count)
           (fib-iter a
                     b
                     <??>      ; compute p'
                     <??>      ; compute q'
                     (/ count 2)))
          (else (fib-iter (+ (* b q) (* a q) (* a p))
                          (+ (* b p) (* a q))
                          p
                          q
                          (- count 1)))))
  ```

  Answer:

  ```math
  a₁ = b₀q + a₀q + a₀p
  b₁ = a₀q + b₀p

  a₂ = b₁q + a₁q + a₁p
  b₂ = a₁q + b₁p

  a₂ = (a₀q + b₀p)q + (b₀q + a₀q + a₀p)q + (b₀q + a₀q + a₀p)p
  b₂ = (b₀q + a₀q + a₀p)q + (a₀q + b₀p)p

  a2 = a₀q² + b₀pq + b₀q² + a₀q² + a₀pq + b₀pq + a₀pq + a₀p²
  b2 = b₀q² + a₀q² + a₀pq + a₀pq + b₀p²

  a2 = a₀(q² + q² + pq + pq + p²) + b₀(pq + q² + qp)
  b2 = a₀(q² + pq + pq) + b₀(q² + p²)

  a₂ = a₀(2q² + 2pq + p²) + b₀(q² + 2pq)
  b₂ = a₀(q² + 2pq) + b₀(q² + p²)

  a₂ = b₀(q² + 2pq) + a₀(q² + 2pq) + a₀(q² + p²)
  b₂ = a₀(q² + 2pq) + b₀(q² + p²)

  a₂ = b₀q′ + a₀q′ + a₀p′
  b₂ = a₀q′ + b₀p′

  p′ = q² + p²
  q′ = q² + 2pq
  ```
  """

  import Integer, only: [is_even: 1]

  @spec fib(non_neg_integer()) :: pos_integer()
  def fib(count), do: fib_iter(1, 0, 0, 1, count)

  @spec fib_iter(
          pos_integer(),
          non_neg_integer(),
          non_neg_integer(),
          pos_integer(),
          non_neg_integer()
        ) :: pos_integer()
  def fib_iter(a, b, p, q, count)

  def fib_iter(_, b, _, _, 0), do: b

  def fib_iter(a, b, p, q, count) when is_even(count) do
    new_p = q * q + p * p
    new_q = q * q + 2 * p * q
    new_count = div(count, 2)

    fib_iter(a, b, new_p, new_q, new_count)
  end

  def fib_iter(a, b, p, q, count) do
    new_a = b * q + a * q + a * p
    new_b = b * p + a * q
    new_count = count - 1

    fib_iter(new_a, new_b, p, q, new_count)
  end
end
