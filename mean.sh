#!/bin/bash

usage() {
    echo "usage: ./mean.sh <column> [file.csv]" 1>&2
    exit 1
}

if [[$# -lt 1 || $# -gt 2]]; then
    usage
fi

column="$1"
file="$2"


if [ -z "$file" ]; then
    file="/dev/stdin"
fi


mean=$(cut -d ',' -f "$column" "$file" | tail -n +2 | { sum=0; count=0; while read value; do sum=$((sum + value)); ((count++)); done; echo "$sum / $count" | bc -l )

echo "Mean of column $column: $mean"
