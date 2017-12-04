< envPaths
< injEfficiency.config

####################################################

## Register all support components
dbLoadDatabase ("${TOP}/dbd/injEfficiency.dbd")
injEfficiency_registerRecordDeviceDriver pdbbase

asSetFilename("$(TOP)/injEfficiencyApp/Db/accessSecurityFile.acf")

## Load record instances
dbLoadRecords("${TOP}/db/injEfficiency.db", "P=${P}, R=${R}, ict-1-charge-pv=${ICT1}, ict-2-charge-pv=${ICT2}")

< save_restore.cmd

## Run this to trace the stages of iocInit
#traceIocInit

iocInit

## Start any sequence programs
# No sequencer program
