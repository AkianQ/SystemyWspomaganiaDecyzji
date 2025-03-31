int: len;
array[0..len-1] of var 0..len-1: series;

constraint forall(i in 0..len-1) (
    count(series, i) == series[i]
);

solve satisfy;

output ["Magic Series: " ++ show(series)];