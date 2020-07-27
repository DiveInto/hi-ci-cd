#!/bin/sh -l

echo "Hello $1"
echo "Hello ${INPUT_WHO-TO-GREET}"
env
time=$(date)
echo "::set-output name=time::$time"