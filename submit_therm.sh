#!/usr/bin/env bash
for L in 8; do
for i in {1..32}; do
    id=${RANDOM}
    TMPFILE=`mktemp --tmpdir=/home/jkott/perm/tmp`
    cp run_l40s.sh $TMPFILE

    echo "julia thermalize.jl --fp64 --rng=$id $L" >> $TMPFILE
    echo "rm $TMPFILE" >> $TMPFILE

    echo $TMPFILE

    chmod +x $TMPFILE
    bsub < $TMPFILE
done
done
