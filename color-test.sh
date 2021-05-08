#!/usr/bin/env bash

printf "          "
for b in $(seq 40 47); do
    printf "%s" "  ${b}m ";
done

echo
for f in "" $(seq 30 37); do
    for s in "" "1;"; do
        printf "%4sm" "${s}${f}"
        printf " \033[%sm%s\033[0m" "$s$f" "gYw "
        for b in $(seq 40 47); do
            printf " \033[%s;%sm%s\033[0m" "$b" "$s$f" " gYw "
        done
        echo
     done
done
