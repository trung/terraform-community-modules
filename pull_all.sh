#!/bin/bash

for d in `ls`
do
  if [ -d "$d" ]; then
    pushd $d
    git pull
    popd
  fi
done
