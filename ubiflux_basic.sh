#!/bin/bash

#Init if not yet started
#TODO
echo "Querying Device..."
printf \n

#Get Basic Info
INLETFLOW="$(ebusctl read -f InletFlow)"
INLETPRESS="$(ebusctl read -f PressureInlet)"
OUTLETFLOW="$(ebusctl read -f ExhaustFlow)"
OUTLETPRES="$(ebusctl read -f PressureExhaust)"
FANSPEEDMODE="$(ebusctl read -f FanSpeed)"
FANSPEEDM3="$(ebusctl read -f SettingInletFlow)"
OUTTEMP="$(ebusctl read -f OutsideTemperature)"
INTEMP="$(ebusctl read -f InsideTemperature)"
INLETFANRPM="$(ebusctl read -f InletFanSpeed)"
OUTLETFANRPM="$(ebusctl read -f ExhaustFanSpeed)"
FILTERSTATUS="$(ebusctl read -f FilterStatus)"
BYPASSOPERATION="$(ebusctl read -f BypassStatus)"
FROSTSTATUS="$(ebusctl read -f FrostStatus)"

echo "###### AIR FLOW INFO ######"
echo "Anti-frost status is: $FROSTSTATUS, bypass valve status is: $BYPASSOPERATION"
echo "Fan speed mode is set to $FANSPEEDMODE, with a flow rate of $FANSPEEDM3 m³/h"
echo "Inlet Flow is $INLETFLOW m³/h, with a pressure of $INLETPRESS Pa"
echo "Outlet Flow is $OUTLETFLOW m³/h, with a pressure of $OUTLETPRES Pa"
printf \n
echo "###### TEMPERATURES ######"
echo "Inside Temperature: $INTEMP °C"
echo "Outside Temperature: $OUTTEMP °C"
printf \n
echo "###### SYSTEM STATUS ######"
echo "The inlet fan is running at $INLETFANRPM RPM"
echo "The outlet fan is running at $OUTLETFANRPM RPM"
echo "The filter is $FILTERSTATUS"
