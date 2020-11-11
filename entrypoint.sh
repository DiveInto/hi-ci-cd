#!/bin/sh -l

echo "Hello $1"
echo "Hello ${INPUT_WHO_TO_GREET}"
echo "Hello $INPUT_WHO_TO_GREET"
env
time=$(date)
echo "::set-output name=time::$time"
echo foobar
