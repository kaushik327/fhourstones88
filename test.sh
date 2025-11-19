#!/bin/bash
start=$(date +%s.%N)
./C476 < test-inputs > test.log
end=$(date +%s.%N)
echo "C476 Time: $(echo "$end - $start" | bc) seconds"

if diff test-outputs <(grep -oE "score [+-=]" test.log); then
    echo "Tests passed!"
else
    echo "Tests failed :(" 
fi
