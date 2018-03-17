#!/bin/bash
echo "Querying Device..."

TIMES=$(date +%s%N)
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

echo "inlet_flow,device=ubbink value=$INLETFLOW $TIMES" >> /etc/ebusd/tmpdata.txt
echo "outlet_flow,device=ubbink value=$OUTLETFLOW $TIMES" >> /etc/ebusd/tmpdata.txt
echo "inlet_pressure,device=ubbink value=$INLETPRESS $TIMES" >> /etc/ebusd/tmpdata.txt
echo "outlet_pressure,device=ubbink value=$OUTLETPRES $TIMES" >> /etc/ebusd/tmpdata.txt
echo "fan_speed_mode,device=ubbink value=\"$FANSPEEDMODE\" $TIMES" >> /etc/ebusd/tmpdata.txt
echo "outside_temperature,device=ubbink,anti_frost=$FROSTSTATUS,bypass_status=$BYPASSOPERATION value=$OUTTEMP $TIMES" >> /etc/ebusd/tmpdata.txt
echo "inside_temperature,device=ubbink value=$INTEMP $TIMES" >> /etc/ebusd/tmpdata.txt
