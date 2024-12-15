#!/bin/bash

# Check if the required arguments are provided
if [ $# -ne 2 ]; then
  echo "Usage: $0 <organization-name> <github-token>"
  exit 1
fi

ORG=$1
TOKEN=$2

PAGE=1
PER_PAGE=100
REPOS_URL="https://api.github.com/orgs/$ORG/repos?per_page=$PER_PAGE&page=$PAGE"

# Fetch repositories and handle pagination
while true; do
  echo "Fetching page $PAGE of repositories..."

  # Fetch repositories
  RESPONSE=$(curl -s -H "Authorization: token $TOKEN" "$REPOS_URL&page=$PAGE")

  # Check if response is empty
  REPO_COUNT=$(echo "$RESPONSE" | jq '. | length')

  if [ "$REPO_COUNT" -eq 0 ]; then
    echo "No more repositories to clone."
    break
  fi

  # Extract clone URLs and clone the repositories
  echo "$RESPONSE" | jq -r '.[].clone_url' | while read repo; do
    echo "Cloning $repo..."
    git clone "$repo"
  done

  # Increment page number for pagination
  PAGE=$((PAGE + 1))
  REPOS_URL="https://api.github.com/orgs/$ORG/repos?per_page=$PER_PAGE"
done
