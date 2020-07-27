#!/bin/sh -l

echo "Hello $1"
env
time=$(date)
echo "::set-output name=time::$time"