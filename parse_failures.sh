#!/bin/bash

# Run with
# yes yes | ./manage.py test api.tests.test_comment 2>&1| parse_failures.sh
# You may want to make an alias for this

# This script simplifies the readout of Django unit tests so that you know
# exactly what unit tests failed
# Standard input is the unit test so you can do
# $ ./manage.py test | parse_failures.sh

# TODO handle arguments properly
if [[ $1 == '-a' ]]
then
    echo 'running all unit tests'
    yes yes | ./manage.py test api 2>&1| parse_failures.sh
    exit 0
fi

while read input
do
    echo $input | grep 'ERROR:\|FAIL:' | sed 's/^.*: \(test.*\) (\(.*\))/\2\.\1/'
done
