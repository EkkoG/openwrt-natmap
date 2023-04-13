#!/bin/sh

# NATMap
outter_port=$2

current_cfg=$(curl -v $EMBY_URL/emby/System/Configuration?api_key=$EMBY_API_KEY)
new_cfg=$(echo $current_cfg | jq ".PublicHttpsPort = $outter_port")
curl -X POST "$EMBY_URL/emby/System/Configuration?api_key=$EMBY_API_KEY" -H "accept: */*" -H "Content-Type: application/json" -d "$new_cfg"
