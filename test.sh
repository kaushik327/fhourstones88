#!/bin/bash
./C476 < test-inputs > test.log

if diff test-outputs <(grep -oE "score [+-=]" test.log); then
    echo "Tests passed!"
else
    echo "Tests failed :(" 
fi
