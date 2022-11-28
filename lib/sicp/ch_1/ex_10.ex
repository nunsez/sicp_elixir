defmodule SICP.Ch1.Ex10 do
  @moduledoc """
  Task:
  The following procedure computes a mathematical function called
  Ackermann's function.

  ```scheme
  (define (A x y)
    (cond ((= y 0) 0)
          ((= x 0) (* 2 y))
          ((= y 1) 2)
          (else (A (- x 1)
                   (A x (- y 1))))))
  ```

  What are the values of the following expressions?

  ```scheme
  (A 1 10)

  (A 2 4)

  (A 3 3)
  ```

  Consider the following procedures, where A is the procedure defined above:

  ```scheme
  (define (f n) (A 0 n))

  (define (g n) (A 1 n))

  (define (h n) (A 2 n))

  (define (k n) (* 5 n n))
  ```

  Give concise mathematical definitions for the functions computed by the
  procedures f, g, and h for positive integer values of n. For example, (k n)
  computes `5 * n * n`.

  Answer:

  ```scheme
  (A 1 10)
  1_024

  (A 2 4)
  65_535

  (A 3 3) ;; equals (A 2 4)
  65_535
  ```
  """

  # Procedures

  @spec ackermann_function(number(), number()) :: number()
  def ackermann_function(x, y) do
    cond do
      y == 0 -> 0
      x == 0 -> 2 * y
      y == 1 -> 2
      true -> ackermann_function(x - 1, ackermann_function(x, y - 1))
    end
  end

  @doc """
  Procedure `f`

  ```scheme
  (define (f n) (A 0 n))
  (define (f n) (* 2 n))
  ```
  """
  @spec f(number()) :: number()
  def f(n), do: ackermann_function(0, n)

  @doc """
  Procedure `g`

  ```scheme
  (define (g n) (A 1 n))
  (A 0 (A 1 (- n 1)))
  (* 2 (A 1 (- n 1)))
  (* 2 (* 2 (A 1 (- n 2)))) ; ect.
  ```
  """
  @spec g(number()) :: number()
  def g(n), do: ackermann_function(1, n)

  @doc """
  Procedure `h`

  https://en.wikipedia.org/wiki/Tetration

  ```scheme
  (define (h n) (A 2 n))
  ```
  """
  @spec h(number()) :: number()
  def h(n), do: ackermann_function(2, n)

  @doc """
  Procedure `k`

  Need not be explained

  ```scheme
  (define (k n) (* 5 n n))
  ```
  """
  @spec k(number()) :: number()
  def k(n), do: 5 * n * n

  @spec my_f(number()) :: number()
  def my_f(n), do: 2 * n

  @spec my_g(number()) :: number()
  def my_g(0), do: 0
  def my_g(1), do: 2
  def my_g(n), do: my_f(my_g(n - 1))

  @spec my_h(number()) :: number()
  def my_h(0), do: 0
  def my_h(1), do: 2
  def my_h(n), do: my_g(my_h(n - 1))
end
