#!/bin/sh
set -eu

COMMAND=${LEGO_COMMAND:-renew}

if [ $COMMAND = "run" ] && [ -e /lego/certificates/$DOMAIN.crt ]; then
  echo skip lego run because crt file exists
  exit
fi

JSON=$(curl -s -X POST "https://api.zerossl.com/acme/eab-credentials?access_key=$ZEROSSL_ACCESS_KEY")
EAB_KEY=$(echo "$JSON" | jq -r .eab_kid)
EAB_HMAC_KEY=$(echo "$JSON" | jq -r .eab_hmac_key)

/usr/bin/lego --path /lego --accept-tos --http --eab --kid "$EAB_KEY" --hmac "$EAB_HMAC_KEY" --server "https://acme.zerossl.com/v2/DV90" --domains $DOMAIN --email $EMAIL $COMMAND
