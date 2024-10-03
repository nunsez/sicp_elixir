defmodule Sicp.Ch1.S2.Ex12 do
  @moduledoc """
  Task:

  The following pattern of numbers is called Pascal's triangle.

  ```
      1
     1 1
    1 2 1
   1 3 3 1
  1 4 6 4 1
     ...
  ```

  The numbers at the edge of the triangle are all 1, and each number inside the
  triangle is the sum of the two numbers above it.35 Write a procedure that
  computes elements of Pascal's triangle by means of a recursive process.
  """

  @first_row_index 1

  @spec solution(integer(), integer()) :: integer()
  # The first column in each row equals 1
  def solution(_, @first_row_index), do: 1

  # The last column in each row equals 1
  def solution(row, column) when row === column, do: 1

  def solution(row, column) do
    solution(row - 1, column - 1) + solution(row - 1, column)
  end
end
