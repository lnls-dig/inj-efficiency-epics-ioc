#!/bin/sh

# Run run*.sh scripts with procServ
/usr/local/bin/procServ -f -n InjEfficiency -i ^C^D 20000 ./runInjEfficiency.sh "$@"
