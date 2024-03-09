#!/bin/bash

mkdir -p five


for dir in {1..5}; do
  mkdir -p five/dir$dir
  for file in {1..4}; do
    seq $file | sed "s/.*/$file/" > five/dir$dir/file$file
  done
done
