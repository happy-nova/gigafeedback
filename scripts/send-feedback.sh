#!/bin/bash
# Send Gigaverse feedback to Slack
# Usage: send-feedback.sh < payload.json
#    or: echo '{"blocks":...}' | send-feedback.sh
#
# Requires: GIGAFEEDBACK_WEBHOOK environment variable

if [ -z "$GIGAFEEDBACK_WEBHOOK" ]; then
  echo "Error: GIGAFEEDBACK_WEBHOOK environment variable not set"
  echo "Set it to your Slack incoming webhook URL"
  exit 1
fi

if [ -t 0 ]; then
  echo "Usage: cat payload.json | $0"
  echo "   or: echo '{...}' | $0"
  exit 1
fi

curl -s -X POST -H 'Content-type: application/json' --data @- "$GIGAFEEDBACK_WEBHOOK"
