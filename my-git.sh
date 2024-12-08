#!/bin/bash

if [ $1 -eq "clone" ]; then
  # Define the repositories, their clone URLs, and specific Dockerfile content
  declare -A repos=(
    ["heartistry"]="https://github.com/votranphi/heartistry.git"
    ["heartistry-task-api"]="https://github.com/votranphi/heartistry-task-api.git"
    ["heartistry-user-api"]="https://github.com/votranphi/heartistry-user-api.git"
  )

  # Dockerfile content for each repository
  declare -A dockerfiles=(
    ["heartistry"]="# Dockerfile's content goes here"
    ["heartistry-task-api"]="# Dockerfile's content goes here"
    ["heartistry-user-api"]="# Dockerfile's content goes here"
  )

  # Clone repositories and create Dockerfiles
  for repo_name in "${!repos[@]}"; do
    repo_url="${repos[$repo_name]}"
    echo "Cloning repository: $repo_name from $repo_url"
    
    # Clone the repository
    git clone "$repo_url" "$repo_name"
    
    # Check if cloning was successful
    if [ $? -eq 0 ]; then
      echo "Repository $repo_name cloned successfully."
      
      # Add specific Dockerfile to the cloned directory
      echo -e "${dockerfiles[$repo_name]}" > "$repo_name/Dockerfile"
      echo "Dockerfile added to $repo_name."
    else
      echo "Failed to clone $repo_name."
    fi
    
    echo "------------------------------------------"
  done

  echo "All repositories processed."
elif [ $1 -eq "pull" ]; then
  # List of directories containing Git repositories
  repos=("heartistry" "heartistry-task-api" "heartistry-user-api")

  # Loop through each repository directory
  for repo in "${repos[@]}"; do
    echo "Updating repository: $repo"
    if [ -d "$repo/.git" ]; then
      # Navigate to the repository directory
      cd "$repo"
      
      # Fetch and pull updates for all branches
      git fetch --all
      git pull --all
      
      # Navigate back to the parent directory
      cd - > /dev/null
    else
      echo "Directory $repo is not a valid Git repository."
    fi
    echo "------------------------------------------"
  done

  echo "All repositories updated."
else
  echo "Invalid action. Only support "clone" or "pull."
fi