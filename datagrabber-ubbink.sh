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

echo "inlet_flow,device=ubbink value=$INLETFLOW $TIMES" >> /etc/ebusd/tmpdata.txt
echo "outlet_flow,device=ubbink value=$OUTLETFLOW $TIMES" >> /etc/ebusd/tmpdata.txt
echo "inlet_pressure,device=ubbink value=$INLETPRESS $TIMES" >> /etc/ebusd/tmpdata.txt
echo "outlet_pressure,device=ubbink value=$OUTLETPRES $TIMES" >> /etc/ebusd/tmpdata.txt
echo "fan_speed_mode,device=ubbink value=\"$FANSPEEDMODE\" $TIMES" >> /etc/ebusd/tmpdata.txt
echo "outside_temperature,device=ubbink,anti_frost=$FROSTSTATUS,bypass_status=$BYPASSOPERATION value=$OUTTEMP $TIMES" >> /etc/ebusd/tmpdata.txt
echo "inside_temperature,device=ubbink value=$INTEMP $TIMES" >> /etc/ebusd/tmpdata.txt
echo "fan_speed_inlet_rpm,device=ubbink value=$INLETFANRPM $TIMES" >> /etc/ebusd/tmpdata.txt
echo "fan_speed_outlet_rpm,device=ubbink value=$OUTLETFANRPM $TIMES" >> /etc/ebusd/tmpdata.txt
echo "bypass_valve,device=ubbink value=\"$BYPASSOPERATION\" $TIMES" >> /etc/ebusd/tmpdata.txt
echo "anti_frost,device=ubbink value=\"$FROSTSTATUS\" $TIMES" >> /etc/ebusd/tmpdata.txt
echo "fan_speed_mode_m3,device=ubbink value=$FANSPEEDM3 $TIMES" >> /etc/ebusd/tmpdata.txt
