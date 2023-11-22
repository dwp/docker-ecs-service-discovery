# DO NOT USE THIS REPO - MIGRATED TO GITLAB

# Rebuild of ecs-service-discovery Docker image for Dataworks

This tool provides Prometheus service discovery for Docker containers running on AWS ECS. You can easily instrument your app using a Prometheus client and enable discovery adding an ENV variable at the Service Task Definition. Your container will then be added to the list of Prometheus targets to be scraped.

This Docker image packages the folowing repositery code https://github.com/signal-ai/prometheus-ecs-sd

## Usage
This container should be run as a sidecar to Prometheus and share a volume because prometheus-ecs-sd will discover scrape targets and write a file containing these
targets to a directory defined by the environment variable `SERVICE_DISCOVERY_DIRECTORY`.
Within Prometheus a scrape job will need to be configured to read this file, eg:
```
- job_name: 'ecs-1m'
  scrape_interval: 1m
  file_sd_configs:
      - files:
            -`SERVICE_DISCOVERY_DIRECTORY`/1m-tasks.json
```

To make your application discoverable by Prometheus, you need to set the following environment variable in your ECS task definition:
```
{ "name": "PROMETHEUS", "value": "true" }
```