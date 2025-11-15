#!/bin/bash

OUTPUT="eDP-1"

monitor-sensor 2>/dev/null | while read -r line; do
    case "$line" in
        *"orientation changed:"*)
            ORI=$(echo "$line" | awk -F': ' '{print $2}')
            case "$ORI" in
                normal)
                    kscreen-doctor output.$OUTPUT.rotation.none ;;
                right-up)
                    kscreen-doctor output.$OUTPUT.rotation.right ;;
                left-up)
                    kscreen-doctor output.$OUTPUT.rotation.left ;;
                bottom-up)
                    kscreen-doctor output.$OUTPUT.rotation.inverted ;;
            esac
        ;;
    esac
done
