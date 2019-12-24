#!/usr/bin/env bash

function cleanup {
    umount /merged
}

mergerfs /disks/*: /merged


trap cleanup EXIT INT

while [[ $(ps -eo 'comm' | grep mergerfs -c) -gt 0 ]]; do
    sleep 1
done

echo mergerfs terminated