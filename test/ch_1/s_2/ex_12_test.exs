defmodule Sicp.Ch1.S2.Ex12Test do
  use ExUnit.Case
  doctest Sicp.Ch1.S2.Ex12

  import Sicp.Ch1.S2.Ex12, only: [solution: 2]

  @tag task: 112
  test "pascal's triangle" do
    assert solution(1, 1) === 1
    assert solution(3, 2) === 2
    assert solution(4, 3) === 3
    assert solution(5, 2) === 4
    assert solution(5, 3) === 6
  end
end
