for i in "$@"
do
case $i in
    -b=*|--bypass=*)
    BYPASS="${i#*=}"
    shift # past argument=value
    ;;
    -s=*|--speedmode=*)
    SPEEDMODE="${i#*=}"
    shift # past argument=value
    ;;
    --default)
    DEFAULT=YES
    shift # past argument with no value
    ;;
    *)
          # unknown option
    ;;
esac
done
echo "Speed Mode      = ${SPEEDMODE}"
if [ -z $SPEEDMODE ];
then
	echo "No speed given, use 'Minimal', 'Reduced', 'Normal' or 'Intensive'"
else
	while [ 1 ]
	do	
		ebusctl w -c kwl FanSpeed $SPEEDMODE
		sleep 60
	done
fi

if [ -z $BYPASS ];
then
	echo "No value"
else
	ebusctl w -c kwl BypassValveOperation $BYPASS
fi

if [ -n $1 ]; then
    echo "Last line of file specified as non-opt/last argument:"
    tail -1 $1
fi
