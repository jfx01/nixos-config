#!/bin/bash

current_mode="$(wmctrl -m | grep 'showing the desktop')"

if [[ "${current_mode##* }" == ON ]]; then
    wmctrl -k off
else
    wmctrl -k on
fi
