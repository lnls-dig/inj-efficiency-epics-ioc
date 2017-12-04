TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

#=============================
# Build an IOC support library
LIBRARY_IOC += injEfficiencySupport

# Link locally-provided code into the support library,
# rather than directly into the IOC application.
# This is required for Windows DLL builds.
injEfficiencySupport_SRCS += initTrace.c

injEfficiencySupport_LIBS += $(EPICS_BASE_IOC_LIBS)

#=============================
# Build the IOC application
PROD_IOC = injEfficiency

# injEfficiency.dbd will be created and installed
DBD += injEfficiency.dbd

# injEfficiency.dbd will include these files:
injEfficiency_DBD += base.dbd
injEfficiency_DBD += initTrace.dbd

# injEfficiency_registerRecordDeviceDriver.cpp derives from injEfficiency.dbd
injEfficiency_SRCS += injEfficiency_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
injEfficiency_SRCS_DEFAULT += injEfficiencyMain.cpp
injEfficiency_SRCS_vxWorks += -nil-

# Link in the code from our support library
injEfficiency_LIBS += injEfficiencySupport

# To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file
#ifneq ($(SNCSEQ),)
    # Build sncExample into injEfficiencySupport
#    sncExample_SNCFLAGS += +r
#    injEfficiency_DBD += sncExample.dbd
#    injEfficiencySupport_SRCS += sncExample.stt
#    injEfficiencySupport_LIBS += seq pv
#    injEfficiency_LIBS += seq pv

    # Build sncProgram as a standalone program
#    PROD_HOST += sncProgram
#    sncProgram_SNCFLAGS += +m
#    sncProgram_SRCS += sncProgram.st
#    sncProgram_LIBS += seq pv
#    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
#endif

# Finally link IOC to the EPICS Base libraries
injEfficiency_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

injEfficiency_DBD += calcSupport.dbd
injEfficiency_DBD += asSupport.dbd

injEfficiency_LIBS += calc
injEfficiency_LIBS += autosave
