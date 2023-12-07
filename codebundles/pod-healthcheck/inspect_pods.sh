#!/bin/bash

# Define the namespace to check
NAMESPACE="$NAMESPACE"

# Get the status of all pods in the namespace
PODS_STATUS=$(kubectl get pods -n "$NAMESPACE" --no-headers -o custom-columns="NAME:.metadata.name,STATUS:.status.containerStatuses[*].state.waiting.reason")

# Initialize an empty array to hold the names of crashlooping pods
CRASH_LOOPING_PODS=()

# Check for crash looping pods
while read -r pod_name pod_status; do
    if [[ $pod_status == "CrashLoopBackOff" ]]; then
        echo "CrashLooping Pod Detected: $pod_name"
        CRASH_LOOPING_PODS+=("$pod_name")
    fi
done <<< "$PODS_STATUS"

# Final status message
if [ ${#CRASH_LOOPING_PODS[@]} -eq 0 ]; then
    echo "No CrashLooping pods in namespace $NAMESPACE"
else
    echo "Detected ${#CRASH_LOOPING_PODS[@]} CrashLooping pods in namespace $NAMESPACE:"
    for pod in "${CRASH_LOOPING_PODS[@]}"; do
        echo " - $pod"
    done
fi
