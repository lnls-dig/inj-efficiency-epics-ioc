#!/bin/sh

set -e
set +u

# Source environment
. ./checkEnv.sh

# Parse command-line options
. ./parseCMDOpts.sh "$@"

# Check last command return status
if [ $? -ne 0 ]; then
	echo "Could not parse command-line options" >&2
	exit 1
fi

if [ -z "$ICT1" ]; then
    echo "\$ICT1 is not set, Please use -f option" >&2
    exit 7
fi

if [ -z "$ICT2" ]; then
    echo "\$ICT2 is not set, Please use -s option" >&2
    exit 7
fi

cd "$IOC_BOOT_DIR"

P="$P" R="$R" ICT1="$ICT1" ICT2="$ICT2" "$IOC_BIN" stInjEfficiency.cmd
