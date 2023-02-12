#!/bin/bash +x
(
  cd ..
  virtualenv "demo"
  source "demo/bin/activate"
  ls -al ./development
  ./development/run.sh stay
)
