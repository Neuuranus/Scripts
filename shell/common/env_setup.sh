#!/bin/bash
function wait-device() {
    timeout 5 adb wait-for-device
}

function fpid() {
    wait-device
    res=$?
    if [ $res -ne 0 ]; then
        printf "device not connect"
        return $res
    fi
    adb shell ps -A | grep $1
}

function init_build_env() {
    export PATH=/usr/local/ssl/bin:$PATH
    export LC_ALL=C
}

function logpid() {
    wait-device
    res=$?
    if [ $res -ne 0 ]; then
        printf "device not connect"
        return $res
    fi
    adb logcat --pid=$1 -v color
}
