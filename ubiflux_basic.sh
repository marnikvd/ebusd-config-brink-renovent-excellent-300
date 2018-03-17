#!/bin/bash

#Init if not yet started
#TODO

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

echo $INLETFLOW
echo $INLETPRESS
echo $OUTLETFLOW
echo $OUTLETPRES
echo $FANSPEEDMODE
echo $FANSPEEDM3
echo $OUTTEMP
echo $INTEMP
echo $INLETFANRPM
echo $FILTERSTATUS
echo $BYPASSOPERATION
echo $FROSTSTATUS



echo -n "SoftwareVersion: "


echo -n "Current Fan Speed: "



#echo -n "Inlet Flow: ";ebusctl read -f InletFlow; echo -n " with system pressure of ";ebusctl read -f PressureInlet; echo -n " Pa"


#echo -n "Exhaust Flow (m³):"
#ebusctl read -f ExhaustFlow
#echo
