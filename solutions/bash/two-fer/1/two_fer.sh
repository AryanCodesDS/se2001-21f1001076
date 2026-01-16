#!/usr/bin/env bash

main(){
    name="$1"
    if [ ${#name} -gt 0 ]; then
        echo "One for $name, one for me."
    else
        echo "One for you, one for me."
    fi
};

main "$1"