#!/bin/bash
# CDC Setup: Oracle (On-Prem) to AlloyDB (Cloud)
# Uses Google Datastream for low-latency synchronization

echo "Initializing CDC Pipeline for USPS Legacy Oracle DB..."

# 1. Create Datastream Connection Profile for Oracle
gcloud datastream connection-profiles create oracle-on-prem \
    --location=us-east1 \
    --type=oracle \
    --oracle-hostname="10.0.0.5" --oracle-port=1521 \
    --oracle-username="CDC_USER" --oracle-password-file="pass.txt"

# 2. Create Destination Profile for AlloyDB
gcloud datastream connection-profiles create alloydb-gold-layer \
    --location=us-east1 \
    --type=alloydb \
    --alloydb-cluster-id="mia-gold-cluster"

# 3. Start Stream
gcloud datastream streams create oracle-to-alloydb-stream \
    --location=us-east1 \
    --source=oracle-on-prem \
    --destination=alloydb-gold-layer \
    --display-name="USPS Legacy Sync"