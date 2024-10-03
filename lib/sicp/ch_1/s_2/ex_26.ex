defmodule Sicp.Ch1.S2.Ex26 do
  @moduledoc """
  Task:

  Louis Reasoner is having great difficulty doing Exercise 1.24. His fast-prime?
  test seems to run more slowly than his prime? test. Louis calls his friend Eva
  Lu Ator over to help. When they examine Louis’s code, they find that he has
  rewrien the expmod procedure to use an explicit multiplication, rather than
  calling square:

  ```scheme
  (define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp)
           (remainder (* (expmod base (/ exp 2) m)
                         (expmod base (/ exp 2) m))
                      m))
          (else
           (remainder (* base
                         (expmod base (- exp 1) m))
                      m))))
  ```

  “I don’t see what difference that could make,” says Louis. “I do.” says Eva.
  “By writing the procedure like that, you have transformed the Θ(logn) process
  into a Θ(n) process.” Explain

  Answer:

  In the new version of the procedure, `expmod` is called twice as often in each
  `even?` case. In the original version of `expmod`, we get 2 `expmod` calls for 2
  `even?` case. In the version with multiplication, we get 4 `expmod` calls for 2
  visits to `even?`, for 3 visits - 8 calls. The order of growth is `O(2^N)`

  The original `expmod` version took `O(logN)`, combining `O(logN)` and `O(2^N)` we get
  `O(log(2^N))` which gives `O(N)`.
  """
end
