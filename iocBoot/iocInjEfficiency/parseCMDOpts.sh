#!/bin/sh

set -e 

usage () {
    echo "Usage:" >&2
    echo "  $1 -t PROCSERV_TELNET_PORT [-P P_VAL] [-R R_VAL] -f ICT_1_CHARGE_PV -s ICT_2_CHARGE_PV " >&2
    echo >&2
    echo " Options:" >&2
    echo "  -t                  Configure procServ telnet port" >&2
    echo "  -P                  Configure value of \$(P) macro" >&2
    echo "  -R                  Configure value of \$(R) macro" >&2
    echo "  -f                  Configure name of charge monitor PV of first ICT" >&2
    echo "  -s                  Configure name of charge monitor PV of second ICT" >&2
}

while getopts ":t:P:R:f:s:" opt; do
  case $opt in
    t) DEVICE_TELNET_PORT="$OPTARG" ;;
    P) P="$OPTARG" ;;
    R) R="$OPTARG" ;;
    f) ICT1="$OPTARG" ;;
    s) ICT2="$OPTARG" ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      usage $0
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      usage $0
      exit 1
      ;;
  esac
done

# if getopts did not process all input
if [ "$OPTIND" -le "$#" ]; then
    echo "Invalid argument at index '$OPTIND' does not have a corresponding option." >&2
    usage $0
    exit 1
fi
