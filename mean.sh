#!/bin/bash

if [[ $# -ne 2 ]]; then 
    echo "usage: $0 <column> [file.csv]" 1>&2 
    exit 0
fi


column="$1"
file="$2"


if [ -z "$file" ]; then
    file="/dev/stdin"
fi


mean=$(cut -d ',' -f "$column" "$file" | tail -n +2 | { sum=0; count=0; while read value; do sum=$(echo "scale=6; $sum + $value" | bc);  count=$(($count+1)); done; echo "scale=6; $sum / $count" | bc ; } )

echo "Mean of column $column: $mean"


