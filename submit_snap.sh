#!/usr/bin/env bash
L=8
N=4

for file in `ls /home/jkott/perm/modelA/thermalized/thermalized_L_${L}_id_*.jld2 | sort -R | head -$N`; do

    id=${RANDOM}
    TMPFILE=`mktemp --tmpdir=/home/jkott/perm/tmp`
    cp run_l40s.sh $TMPFILE

    echo "julia snap.jl --fp64 --rng=$id $L" >> $TMPFILE

    echo "rm $TMPFILE" >> $TMPFILE

    echo $TMPFILE

    chmod +x $TMPFILE
    bsub < $TMPFILE

done
