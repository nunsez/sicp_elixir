defmodule Sicp.Ch1.S3.Ex37 do
  @moduledoc """
  Task:

  a. An infinite `continued fraction` is an expression of the form

  ```
               N₁
  f = -------------------.
                 N₂
      D₁ + --------------
                   N₃
           D₂ + ---------
                D₃ + ...
  ```

  As an example, one can show that the infinite continued fraction expansion with
  the `Nᵢ` and the `Dᵢ` all equal to `1` produces `1/ϕ`, where `ϕ` is the golden ratio
  (described in Section 1.2.2). One way to approximate an infinite continued
  fraction is to truncate the expansion after a given number of terms. Such a
  truncation — a so-called `k-term finite continued fraction` — has the form

  ```
         N₁
  ----------------.
           N₂
  D₁ + -----------
       .
         .      Nₖ
           . + ---
                Dₖ
  ```

  Suppose that `n` and `d` are procedures of one argument (the term index `i`) that
  return the `Nᵢ` and `Dᵢ` of the terms of the continued fraction. Define a procedure
  `cont-frac` such that evaluating `(cont-frac n d k)` computes the value of the
  `k`-term finite continued fraction. Check your procedure by approximating `1/ϕ`
  using

  ```scheme
  (cont-frac (lambda (i) 1.0)
             (lambda (i) 1.0)
             k)
  ```

  for successive values of `k`. How large must you make `k` in order to get an
  approximation that is accurate to 4 decimal places?

  b. If your `cont-frac` procedure generates a recursive process, write one that
  generates an iterative process. If it generates an iterative process, write one
  that generates a recursive process.

  Answer:
  k = 12 gives us a result of 0.618025... within 0.00001 of the expected 0.61803.
  """

  @doc """
  Recursive process.
  """
  def cont_frac_rec(n, d, k) do
    cont_frac_rec(n, d, k, 1)
  end

  def cont_frac_rec(n, d, k, i) do
    next_n = n.(i)
    next_d = d.(i)

    if k == i do
      next_n / next_d
    else
      next_res = cont_frac_rec(n, d, k, i + 1)
      next_n / (next_d + next_res)
    end
  end

  @doc """
  Iterative process.
  """
  def cont_frac_iter(n, d, k) do
    cont_frac_iter(n, d, k, 0)
  end

  def cont_frac_iter(n, d, i, res) do
    if i == 0 do
      res
    else
      next_n = n.(i)
      next_d = d.(i)
      next_res = next_n / (next_d + res)
      cont_frac_iter(n, d, i - 1, next_res)
    end
  end
end
