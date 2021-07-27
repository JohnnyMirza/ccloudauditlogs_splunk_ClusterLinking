# Confluent Cloud AuditLogs (Or really any other topic) sink to Splunk
Quicky get access to Confluent Cloud with this script. This repo runs a standalone Kafka connect worker which is preconfigured to connect to a Confluent Cloud instance.
It includes two source connectors:

- Splunk Sink Connector:https://www.confluent.io/hub/splunk/kafka-connect-splunk

To get started:
```
1. git clone https://github.com/JohnnyMirza/ccloudauditlogs_splunk.git
2. cd ccloudauditlogs_splunk
2. edit the .env file and fill in your credentials. To get the details Login to Confluent Cloud then to your Environment, and follow steps below:
-CLOUD_URL: cluster->Settings->Bootstrap server
-CLOUD_TOKEN: cluster->API keys
-CLOUD_SECRET: cluster->API keys
-SCHEMA_REGISTRY_URL: Environment->Schema Registry->API endpoint
-SCHEMA_REGISTRY_BASIC_AUTH: Environment->Schema Registry->API credentials (e.g. SCHEMA_REGISTRY_BASIC_AUTH='key':'secret')
4. docker-compose up -d
```


**Access to Splunk Dashboards
to log into splunk go to:
- `http://localhost:8000/en-GB/app/confluent_cloud_app/audit_overview`
- `http://localhost:8000`
(admin/Password1)

**troubleshooting
the "submit_splunk_sink.sh" doesn't run, you can run it mannually in the scripts folder.