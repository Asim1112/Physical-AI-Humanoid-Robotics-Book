# PowerShell GitHub Pages Deployment Script

# Build the Docusaurus site
npm run build

# Navigate to the build output directory
Set-Location -Path "build"

# Initialize a new git repository
git init

# Add all files
git add .

# Commit changes
git commit -m "Deploy to GitHub Pages"

# Set the remote origin to your GitHub repository
# Replace with your actual GitHub repository URL
git remote add origin https://github.com/Asim1112/Physical-AI-Humanoid-Robotics-Book.git

# Push to the gh-pages branch
git push -f origin main:gh-pages

Write-Host "Deployment to GitHub Pages completed!"