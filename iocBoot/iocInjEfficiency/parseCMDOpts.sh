#!/bin/sh

while [ "$#" -gt 0 ]; do
    case "$1" in
        "-P") P="$2" ;;
        "-R") R="$2" ;;
        "-f"|"--first-ict-charge-pv") ICT1="$2" ;;
        "-s"|"--second-ict-charge-pv") ICT2="$2" ;;
        *) echo "Usage:" >&2
            echo "  $0 -f ICT_1_CHARGE_PV -s ICT_2_CHARGE_PV [-P P_VAL] [-R R_VAL] " >&2
            echo >&2
            echo " Options:" >&2
            echo "  -f or --first-ict-charge-pv              Configure name of charge monitor PV of first ICT " >&2
            echo "  -s or --second-ict-charge-pv             Configure name of charge monitor PV of second ICT " >&2
            echo "  -P                                       Configure value of \$(P) macro" >&2
            echo "  -R                                       Configure value of \$(R) macro" >&2
            exit 2
    esac

    shift 2
done
