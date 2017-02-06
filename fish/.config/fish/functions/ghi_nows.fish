#!/usr/bin/bash

# Mark an issue as in progress in github
#
# Example:
# ghi_now 1 2 3                        # set issues #1 #2 #3 as in-progress
# ghi_now "some issue" "another issue" # open a new issue and mark as in-progress

function ghi_nows() {
  for i in $@; do
    ghi_now $i
  done
}

ghi_nows $@