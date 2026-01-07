# GitHub Pages Deployment Guide

This guide explains how to deploy the Docusaurus frontend to GitHub Pages.

## Prerequisites

1. Your repository must be public on GitHub
2. GitHub Pages must be enabled in your repository settings
3. The repository should be configured to deploy from the `gh-pages` branch

## Deployment Steps

### 1. Update Configuration

Before deployment, ensure the following configuration is correct in `docusaurus.config.js`:

- `url`: Set to your GitHub Pages URL (e.g., `https://asim1112.github.io`)
- `baseUrl`: Set to your project name (e.g., `/Physical-AI-Humanoid-Robotics-Book/`)

### 2. Build and Deploy

#### Using the Deployment Script (Recommended)

**On Windows:**
```bash
powershell -ExecutionPolicy Bypass -File ./deploy-github-pages.ps1
```

**On Unix/Linux/Mac:**
```bash
chmod +x ./deploy-github-pages.sh
./deploy-github-pages.sh
```

#### Manual Deployment

1. Build the site:
```bash
npm run build
```

2. Navigate to the `build` directory and deploy to your `gh-pages` branch manually.

### 3. Environment Configuration

The deployment supports runtime configuration of the backend API URL:

- The default API URL is set in `static/env-config.js`
- You can override it by editing the `env-config.js` file after deployment
- For testing, you can temporarily override the API URL by adding a query parameter: `?api_url=https://your-backend-url.com`

## Troubleshooting

### API URL Issues
If the chat widget is still connecting to localhost:
1. Check that `env-config.js` is loaded correctly in the deployed site
2. Verify the API URL in the browser's developer console
3. Ensure the GitHub Pages site is served with the correct base URL

### 404 Errors
- Ensure the `baseUrl` in `docusaurus.config.js` matches your GitHub repository name
- If deployed to a user/organization page, the base URL should be `/`
- If deployed to a project page, the base URL should be `/<repository-name>/`

## Configuration Files

- `docusaurus.config.js`: Main site configuration
- `static/env-config.js`: Runtime environment configuration
- `src/components/ChatWidget/index.jsx`: Main chat component with API URL logic

## Backend API

The frontend connects to the backend API specified in `static/env-config.js`. By default, it connects to:
`https://asim1112-humanoid-robotics-hackathon.hf.space`

Make sure your backend is accessible and CORS is configured to allow requests from your GitHub Pages URL.