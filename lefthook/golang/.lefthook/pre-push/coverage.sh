#!/bin/sh

echo "Run tests"

$MINIMAL_COVERAGE=15
coverage=$(go test ./services/elasticsearch -cover |  awk '{print $5*1}')
echo $coverage
if (( $(echo "$coverage > $MINIMAL_COVERAGE" | bc -l) )); then
	echo " coverage is valid!"
	exit 0
else
	echo 1>&2 "You should write more tests :)"
    	exit 1
fi
