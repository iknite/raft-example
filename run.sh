#!/usr/bin/env sh

go run . -nodeid 1 &
pids[0]=$!

go run . -nodeid 2 &
pids+=($!)

go run . -nodeid 3 &
pids+=($!)

for pid in ${pids[*]}; do
    wait $pid
done

rm -rf raft-example.db

