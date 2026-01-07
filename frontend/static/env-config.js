// Environment configuration for GitHub Pages deployment
// This file can be customized during GitHub Pages deployment to set the API URL
window.ENV = window.ENV || {};

// Set the API URL - this can be overridden during deployment
window.ENV.VITE_API_URL = window.ENV.VITE_API_URL || 'https://asim1112-humanoid-robotics-hackathon.hf.space';

// Allow external configuration of API URL via query parameter for testing
const urlParams = new URLSearchParams(window.location.search);
const apiParam = urlParams.get('api_url');
if (apiParam) {
    window.ENV.VITE_API_URL = apiParam;
}