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

  iex> SICP.Ch1.Ex10.ackermann_function(1, 10)
  1_024

  iex> SICP.Ch1.Ex10.ackermann_function(2, 4)
  65_536

  iex> SICP.Ch1.Ex10.ackermann_function(3, 3)
  65_536
  """

  @doc """
  ```scheme
  (define (A x y)
    (cond ((= y 0) 0)
          ((= x 0) (* 2 y))
          ((= y 1) 2)
          (else (A (- x 1)
                   (A x (- y 1))))))
  ```
  """
  @spec ackermann_function(number(), number()) :: number()
  def ackermann_function(_, 0), do: 0
  def ackermann_function(0, y), do: 2 * y
  def ackermann_function(_, 1), do: 2

  def ackermann_function(x, y) do
    ackermann_function(x - 1, ackermann_function(x, y - 1))
  end

  # Procedures

  @doc """
  ```scheme
  (define (f n) (A 0 n))
  ```
  """
  @spec f(number()) :: number()
  def f(n), do: ackermann_function(0, n)

  @doc """
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
  https://en.wikipedia.org/wiki/Tetration

  ```scheme
  (define (h n) (A 2 n))
  ```
  """
  @spec h(number()) :: number()
  def h(n), do: ackermann_function(2, n)

  @doc """
  ```scheme
  (define (k n) (* 5 n n))
  ```
  """
  @spec k(number()) :: number()
  def k(n), do: 5 * n * n

  # Concise mathematical definitions

  @doc """
  ```
  f = 2n
  ```

  iex> SICP.Ch1.Ex10.f_explained(2) === SICP.Ch1.Ex10.f(2)
  true

  iex> SICP.Ch1.Ex10.f_explained(3) === SICP.Ch1.Ex10.f(3)
  true

  iex> SICP.Ch1.Ex10.f_explained(4) === SICP.Ch1.Ex10.f(4)
  """
  @spec f_explained(number()) :: number()
  def f_explained(n) when n >= 0, do: 2 * n

  @doc """
  ```
  g = 0, n = 0
  g = 2, n = 1
  g = f(g(n - 1)), n > 1
  ```

  iex> SICP.Ch1.Ex10.g_explained(3) === SICP.Ch1.Ex10.g(3)
  true

  iex> SICP.Ch1.Ex10.g_explained(4) === SICP.Ch1.Ex10.g(4)
  true
  """
  @spec g_explained(number()) :: number()
  def g_explained(0), do: 0
  def g_explained(1), do: 2
  def g_explained(n) when n > 1, do: f_explained(g_explained(n - 1))

  @doc """
  ```
  h = 0, n = 0
  h = 2, n = 1
  h = g(h(n - 1)), n > 1
  ```

  iex> SICP.Ch1.Ex10.h_explained(3) === SICP.Ch1.Ex10.h(3)
  true

  iex> SICP.Ch1.Ex10.h_explained(4) === SICP.Ch1.Ex10.h(4)
  true
  """
  @spec h_explained(number()) :: number()
  def h_explained(0), do: 0
  def h_explained(1), do: 2
  def h_explained(n) when n > 1, do: g_explained(h_explained(n - 1))

  @doc """
  Need not be explained

  iex> SICP.Ch1.Ex10.k_explained(3) === SICP.Ch1.Ex10.k(3)
  true

  iex> SICP.Ch1.Ex10.k_explained(4) === SICP.Ch1.Ex10.k(4)
  true
  """
  @spec k_explained(number()) :: number()
  def k_explained(n), do: 5 * n * n
end
