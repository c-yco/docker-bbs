#!/bin/bash
# Get new tags from the remote

 git -C $1 fetch --tags
 
# Get the latest tag name
 latestTag=$(git -C $1 describe --tags `git rev-list --tags --max-count=1`)
 
# Checkout the latest tag
 git -C $1 checkout $latestTag
