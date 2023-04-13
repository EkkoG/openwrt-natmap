#!/bin/sh

# NATMap
outter_ip=$1
outter_port=$2
ip4p=$3
inner_port=$4
protocol=$5

current_cfg=$(curl -v $EMBY_URL/emby/System/Configuration?api_key=$EMBY_API_KEY)
new_cfg=$(echo $current_cfg | jq ".PublicHttpsPort = $outter_port")
curl -X POST "$EMBY_URL/emby/System/Configuration?api_key=$EMBY_API_KEY" -H "accept: */*" -H "Content-Type: application/json" -d "$new_cfg"