#!/bin/bash

curl -s https://api.github.com/users/terraform-community-modules/repos | grep "full_name" | awk -F'"' '{print $4}'
