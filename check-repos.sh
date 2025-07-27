#!/bin/bash
# Check git status for all repositories in subdirectories

for dir in */; do
  if [ -d "$dir/.git" ]; then
    if [[ -n $(git -C "$dir" status -s 2>/dev/null) ]]; then
      echo -e "\n\033[1;34m=== $dir ===\033[0m"
      git -C "$dir" status -s
    fi
  fi
done