#!/bin/bash

for arg
do
  cmd="$cmd $arg"
done

java -cp /opt/mesquite mesquite.Mesquite $cmd


