#!/usr/bin/env bash

paste -d'|' \
    <(echo -e "install\n-------" && yq -r '.[].roles[].role' install.yaml | sort) \
    <(echo -e "varsall\n-------" && grep '^[a-z].*:$' group_vars/all | cut -d: -f1 | sort) \
    <(echo -e "dirents\n-------" && find roles/ -maxdepth 1 -type d | cut -d/ -f2 | sed 1d - | grep -v common | sort) \
    <(echo -e "mainyml\n-------" && find roles/ -type f -name main.yaml | cut -d'/' -f2 | grep -v common | sort) \
    | column -s'|' -t
