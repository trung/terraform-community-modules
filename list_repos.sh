#!/bin/bash
has_repos=1
page=1
while [ "$has_repos" -eq "1" ];
do
  has_repos=0
  for r in $(curl -s "https://api.github.com/users/terraform-community-modules/repos?page=$page" | grep "full_name" | awk -F'"' '{print $4}')
  do
    has_repos=1
    echo -n "$r --> "
    rname=$(echo "$r" | awk -F'/' '{print $2}')
    if [ -d "$rname" ]; then
      echo "found"
    else
      echo "NOT FOUND"
      git clone git@github.com:$r.git
    fi
  done
  page=$((page+1))
done
