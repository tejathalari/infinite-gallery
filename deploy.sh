#!/bin/bash

# Build the Vue.js project
npm run build

# Create a temporary directory to hold the built files
mkdir deploy_temp

# Copy the built files to the temporary directory
cp -r dist/* deploy_temp/

# Initialize a new Git repository in the temporary directory
cd deploy_temp
git init

# Add all files to the Git repository
git add .

# Commit the changes
git commit -m "Deploy to GitHub Pages"

# Push the changes to the "gh-pages" branch of the remote repository
git push -f https://github.com/tejathalari/infinite-gallery.git master:gh-pages

# Clean up - remove the temporary directory
cd ..
rm -rf deploy_temp

echo "Deployment complete!"
