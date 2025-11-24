#!/bin/bash

echo "-----> Starting Deployment..."

# 1. Set Environment to Prod
export MIX_ENV=prod

# 2. Pull latest code from Git
echo "-----> Pulling changes from Git..."
git pull origin main

# 3. Fetch Dependencies
echo "-----> Fetching dependencies..."
mix deps.get --only prod

# 4. Compile Assets
# echo "-----> Building Assets..."
# npm install --prefix assets
# mix assets.deploy

# 5. Generate Release
echo "-----> Generaring Release..."
# We use --overwrite to replace the old binary
mix release --overwrite

# 6. Run Database Migrations
echo "-----> Running Migrations..."
# Note: Ensure the path matches your app name
_build/prod/rel/my_app/bin/my_app eval "MyApp.Release.migrate"

# 7. Restart the Systemd Service
echo "-----> Restarting Application Service..."
sudo systemctl restart my_app

echo "-----> Deployment Complete! 🚀"