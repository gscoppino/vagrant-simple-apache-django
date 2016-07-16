#!/usr/bin/env bash
# A script to set a key = value statement in a Python script.
# Hardcoded for settings.py for the time being.

while getopts ":d:k:v:" opt; do
    case $opt in
        d)
            dir=$OPTARG
            ;;
        k)
            key=$OPTARG
            ;;
        v)
            value=$OPTARG
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done

cd $dir

statement="$key = $value"
if ! grep -q "$key" settings.py; then
    echo "$statement" >> settings.py
else
    sed --in-place "/^$key\s*=/s/^$key\s*.*/$statement/g" settings.py
fi

exit 0