#!/bin/bash

for r in $(curl -s https://api.github.com/users/terraform-community-modules/repos | grep "full_name" | awk -F'"' '{print $4}')
do
   echo -n "$r --> "
   rname=$(echo "$r" | awk -F'/' '{print $2}')
   if [ -d "$rname" ]; then
      echo "found"
   else
      echo "NOT FOUND"
   fi
done
