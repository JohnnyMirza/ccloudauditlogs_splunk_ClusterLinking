#!/bin/bash

source "../.env"

HEADER="Content-Type: application/json"
DATA=$( cat << EOF
{
  "name": "SplunkSink",
  "config": {
    "connector.class": "com.splunk.kafka.connect.SplunkSinkConnector",
    "topics": "${KAFKA_TOPIC_NAME}",
    "splunk.hec.uri":"https://splunk_search_ccloudmetrics:8088",
    "splunk.hec.token":"3bca5f4c-1eff-4eee-9113-ea94c284478a",
    "key.converter": "org.apache.kafka.connect.storage.StringConverter",
    "value.converter": "org.apache.kafka.connect.storage.StringConverter",
    "confluent.topic.bootstrap.servers":"${CLOUD_URL}",
    "splunk.hec.ssl.validate.certs": "false",
    "splunk.hec.json.event.formatted": "false",
    "splunk.hec.ack.enabled": "TRUE",
    "splunk.hec.ack.poll.interval": "20",
    "splunk.hec.ack.poll.threads": "2",
    "splunk.hec.event.timeout": "120",
    "splunk.hec.raw": "false",
    "tasks.max": "1"
  }
}
EOF
)

curl -X POST -H "${HEADER}" --data "${DATA}" http://localhost:8083/connectors