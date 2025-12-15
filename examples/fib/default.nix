let
  fib = i:
    if i == 0 then 0
    else if i == 1 then 1
    else fib (i - 1) + fib (i - 2);
in
builtins.map fib [ 0 1 2 3 4 5 6 7 8 9 10 ]
