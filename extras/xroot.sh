
#!/bin/sh
export DISPLAY=:0

BATT=$(/usr/bin/awk '/rate/ {rate=$3} \
	/charging state/ {charge=$3} \
	/rem/ { rem=$3 } \
	END { if (charge=="charging") { state="charge" } \
	    else if (charge=="charged") { state="full" } \
	            else { state=sprintf("%2.1f hr",rem/rate) } \
	            printf("%3.1f%% (%s)",rem/50,state) }' \
	    /proc/acpi/battery/BATT/state)
DATE=$(/bin/date +"%a %b %d %H:%M")
ROOT="$BATT $DATE"
#echo $ROOT
xsetroot -name "$ROOT"
