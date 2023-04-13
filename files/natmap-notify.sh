#!/bin/sh
# NATMap
outter_ip=$1
outter_port=$2
ip4p=$3
inner_port=$4
protocol=$(echo $5 | tr 'a-z' 'A-Z')

if [ $IM_NOTIFY_ENABLE != 1 ]; then
	exit 0
fi

msg="$NAT_NAME\nNew $protocol port mapping: $inner_port -> $outter_ip:$outter_port\nIP4P: $ip4p"
if [ -n "$MSG_OVERRIDE" ]; then
	msg="$MSG_OVERRIDE"
fi

if [ -f "/etc/natmap/plugin-notify/$IM_NOTIFY_CHANNEL.sh" ]; then
	source "/etc/natmap/plugin-notify/$IM_NOTIFY_CHANNEL.sh" "$msg"
fi