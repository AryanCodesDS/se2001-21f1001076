#!/usr/bin/env bash

main(){
    local num=$1
    local orig=$num
    local sum=0
    local power=${#num}
    
    while (( num>0 )); do
          local digit=$(( num%10 ))
          (( sum += digit**power ))
          (( num=num/10 ))  
    done

    if (( sum == orig )); then
        echo true
    else
        echo false
    fi
}

main "$1"