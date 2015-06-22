#!/bin/bash

# This script simplifies the readout of Django unit tests so that you know
# exactly what unit tests failed
# Standard input is the unit test so you can do
# $ ./manage.py test | parse_failures.sh

while read input
do
    echo $input | grep 'ERROR:\|FAIL:' | sed 's/^.*: \(test.*\) (\(.*\))/\2\.\1/'
done
