#!/usr/bin/env bash

reverse (){
    echo "$@"|rev
}

reverse "$@"
