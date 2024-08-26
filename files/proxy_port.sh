#!/bin/sh

outter_port=$2

content=$(curl -s $PROXY_PORT_CONTENT_URL)
if [ -z "$content" ]; then
    echo "Failed to get gist content"
    exit 1
fi

if [ "$PROXY_PORT_CONFIG_TYPE" = "clash" ]; then
  # replace port, allow space before and after port
  content=$(echo "$content" | sed "s/port[[:space:]]*:[[:space:]]*[0-9]*/port: $outter_port/g")
else
  echo "Unknown config type: $PROXY_PORT_CONFIG_TYPE"
  exit 1
fi

#replace newline to \n
content=$(echo "$content" | awk '{printf "%s\\n", $0}')
body="{\"files\": {\"$PROXY_PORT_GIST_FILENAME\": {\"content\": \"$content\"}}}"
# update gist content
url="https://api.github.com/gists/$PROXY_PORT_GIST_ID"
curl -X PATCH \
    -H "Authorization: token $PROXY_PORT_GITHUB_TOKEN" \
    -d  "$body"\
    $url