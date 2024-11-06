#!/bin/bash

# Check for root privileges
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 
  exit 1
fi

set -eEo pipefail

if [ -z "$CLOUD_SHELL" ]; then
  printf "Checking for required npm version...\n"

  npm install -g npm > /dev/null 2>&1
  printf "Completed.\n\n"


 printf "Setting up NVM...\n"
  export NVM_DIR="/usr/local/nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  printf "Completed.\n\n"

  printf "Updating nodeJS version...\n"
  nvm install --lts
  printf "Completed.\n\n"
fi

# Update package lists
apt-get update -y

# Install necessary packages
apt-get install -y nodejs npm git build-essential curl

printf "Installing == angularcloudapp == dependencies...\n"
# cd ./angularcloudapp
npm install
printf "Completed.\n\n"

# Install Angular CLI globally
npm install -g @angular/cli

# Set up a project directory (replace with your desired path)
PROJECT_DIR="/home/user/angularcloudapp"
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"


# Check if the project already exists
if [ ! -d "my-angular-app" ]; then
    ng new my-angular-app
fi

cd my-angular-app

# Install project dependencies
npm install


# ---  Configuration for deployment (adjust these values as needed) ---

# Example: Setting environment variables (replace with your actual credentials)
# export MY_API_KEY="your_actual_api_key"
# export MY_DATABASE_URL="your_actual_database_url"

# ---  Additional setup steps ---
# You can add other necessary setup steps for your project here.
# For example, setting up a reverse proxy (Nginx), database, etc.


# Example: Run the Angular app in production mode
# ng build --prod
ng build 


printf "=-=-=-=-=-= Setup completed successfully! =-=-=-=-=-=-=-\n"

if [ -z "$CLOUD_SHELL" ]; then
  printf "\n"
  printf "###############################################################################\n"
  printf "#                                   NOTICE                                    #\n"
  printf "#                                                                             #\n"
  printf "# Make sure you have a compatible nodeJS version with the following command:  #\n"
  printf "#                                                                             #\n"
  printf "# nvm install --lts                                                           #\n"
  printf "#                                                                             #\n"
  printf "###############################################################################\n"
fi