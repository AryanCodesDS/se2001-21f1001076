#!/usr/bin/env bash

declare -A allergens=(
  [eggs]=1
  [peanuts]=2
  [shellfish]=4
  [strawberries]=8
  [tomatoes]=16
  [chocolate]=32
  [pollen]=64
  [cats]=128
)

allergen_list=(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats)

main() {
  local score=$1
  local mode=$2
  shift 2

  case $mode in
    allergic_to)
      for allergen in "$@"; do
        local value=${allergens[$allergen]}
        if [[ -z $value || $(( score & value )) -eq 0 ]]; then
          echo false
          return
        fi
      done
      echo true
      ;;

    list)
      local results=()
      for allergen in "${allergen_list[@]}"; do
        local value=${allergens[$allergen]}
        if (( score & value )); then
          results+=("$allergen")
        fi
      done
      echo "${results[*]}"
      ;;

    *)
      echo "Usage: $0 <score> {allergic_to <allergen(s)> | list}"
      exit 1
      ;;
  esac
}

main "$@"
