#!/bin/bash
# DigitalOcean Droplet Deployment Script

# 1. Define variables
DROPLET_NAME="jvm-automated-droplet"
REGION="syd1"          # Sydney region
SIZE="s-1vcpu-1gb"    # Example $6/mo plan
IMAGE="ubuntu-22-04-x64"
#DISK=“<size-of-disk-20G+>”
#MEM=“<memory-4GB+>”

# 2. Create the Droplet
echo "Provisioning Droplet..."
time doctl compute droplet create "$DROPLET_NAME" \
  --region "$REGION" \
  --size "$SIZE" \
  --image "$IMAGE" \
  --enable-monitoring \
  --enable-ipv6 \
  --user-data-file "jvm-dev-enviroment.sh" \
  --wait
