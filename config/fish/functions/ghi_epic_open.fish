#!/usr/bin/bash

# Opens an "epic" in github
# If a milestone exists, close it.
# Otherwise simply push changes.
#
# 1. Checkout a new feature branch
# 2. Open a new milestone
# 3. Setup local environment for milestone
#
# Example:
# ghi_epic_open "epic title"

function ghi_epic_open() {
    if [[ -n "$1" ]]
    then
        local TITLE=$1
        local FORMATTED=${1// /-}
        echo "Checking out a new branch f-${FORMATTED}" &&
        git checkout -b "f-${FORMATTED}" &&
        echo "Creating a new milestone $TITLE" &&
        local MILESTONE=$(ghi milestone -m "${TITLE}" | awk 'match($0, /[0-9]+/){print substr($0, RSTART, RLENGTH)}') &&
        echo "Setting .milestone" &&
        rm -f .milestone
        echo ${MILESTONE} > .milestone
        echo "opened milestone ${MILESTONE} and set up env"
    else
        echo "Please provide epic title"
    fi
}

ghi_epic_open $@