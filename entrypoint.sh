#! /bin/bash

set -eu

if [ -n "$WORKING_DIRECTORY" ]
then
  printf "\nSwitching into $WORKING_DIRECTORY\n"
  cd $WORKING_DIRECTORY
fi

cargo lambda $@
