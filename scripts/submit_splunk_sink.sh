#!/bin/bash

source ".env"

HEADER="Content-Type: application/json"
DATA=$( cat << EOF
{
  "name": "SplunkSink",
  "config": {
    "connector.class": "com.splunk.kafka.connect.SplunkSinkConnector",
    "topics": "confluent-audit-log-events",
    "splunk.hec.uri":"https://splunk_search:8088",
    "splunk.hec.token":"3bca5f4c-1eff-4eee-9113-ea94c284478a",
    "value.converter":"org.apache.kafka.connect.storage.StringConverter",
    "splunk.hec.ssl.validate.certs":"false",
    "confluent.topic.bootstrap.servers":"${CLOUD_URL}",
    "splunk.hec.json.event.formatted": false,
    "tasks.max": "1"
  }
}
EOF
)

curl -X POST -H "${HEADER}" --data "${DATA}" http://localhost:8083/connectors
