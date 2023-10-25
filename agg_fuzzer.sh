#!/bin/bash

# Run the AggregationFuzzer.

if [ "x$VELOX_BUILD_HOME" = "x" ]; then
    echo "VELOX_BUILD_HOME is not set!"
    exit 1;
fi

function_options=""
duration_options=""
seed=""

# Help.
if [ "x$1" = "x-h" ]; then
    function_options="--only '$1'"
    echo "agg_fuzzer.sh [functions] [durations] [seed]"
    exit 0;
fi

if [ "x$1" != "x" ]; then
    function_options="--only '$1'"
fi

if [ "x$2" != "x" ]; then
    duration_options="--duration_sec $2"
fi

if [ "x$3" != "x" ]; then
    seed="--seed $3"
fi

command="${VELOX_BUILD_HOME}/velox/exec/tests/velox_aggregation_fuzzer_test \
${function_options} ${duration_options} ${seed} --logtostderr=1"

echo "VELOX_BUILD_HOME: $VELOX_BUILD_HOME"
echo "functions: ${function_options}"
echo "duration: ${duration_options}"
echo "Full command: $command"

${command}