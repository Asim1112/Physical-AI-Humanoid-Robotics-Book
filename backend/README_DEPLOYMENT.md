# Backend Deployment Guide

## Hugging Face Spaces Deployment

### Prerequisites
- Hugging Face account
- All environment variables ready (see below)

### Step 1: Create Hugging Face Space

1. Go to https://huggingface.co/spaces
2. Click "Create new Space"
3. Configure:
   - **Space name**: `rag-chatbot-backend` (or your choice)
   - **License**: MIT
   - **Space SDK**: Docker
   - **Visibility**: Public or Private

### Step 2: Configure Environment Variables (Secrets)

In your Space settings, add these secrets:

```
NEON_DATABASE_URL=***********************************************************************
GROQ_API_KEY=***********************************************************************
QDRANT_URL=***********************************************************************
QDRANT_API_KEY=***********************************************************************
QDRANT_COLLECTION_NAME=humanoid-robotics-textbook
FRONTEND_URL=https://your-frontend.vercel.app
```

**IMPORTANT**: Update `FRONTEND_URL` with your actual Vercel deployment URL after deploying the frontend.

### Step 3: Push Code to Hugging Face

```bash
# Clone your Space repository
git clone https://huggingface.co/spaces/YOUR_USERNAME/rag-chatbot-backend
cd rag-chatbot-backend

# Copy backend files
cp -r ../backend/* .

# Commit and push
git add .
git commit -m "Initial backend deployment"
git push
```

### Step 4: Verify Deployment

1. Wait for build to complete (~5-10 minutes)
2. Your API will be available at: `https://YOUR_USERNAME-rag-chatbot-backend.hf.space`
3. Test health endpoint:
   ```bash
   curl https://YOUR_USERNAME-rag-chatbot-backend.hf.space/health
   ```

4. Expected response:
   ```json
   {"status": "ok", "timestamp": 1234567890.123}
   ```

### Step 5: Update CORS Settings

The backend is pre-configured to accept requests from your Vercel frontend. CORS origins include:
- `http://localhost:3000` (local development)
- `http://localhost:5173` (alternative dev)
- Environment variable `FRONTEND_URL` (production)

Make sure to set `FRONTEND_URL` in Hugging Face Spaces secrets to your Vercel URL.

### Troubleshooting

**Build fails:**
- Check Logs tab in Hugging Face Spaces
- Verify all dependencies in requirements.txt are compatible
- Check Python version (3.11)

**Database connection issues:**
- Verify NEON_DATABASE_URL secret is set correctly
- Check Neon database is not paused
- Verify SSL mode is set to `require`

**API not responding:**
- Check if Space is running (should show green indicator)
- Verify port 7860 is exposed in Dockerfile
- Check health endpoint first before testing /api/chat

## Alternative Deployment Options

### Render.com
1. Create new Web Service
2. Connect repository
3. Set environment variables
4. Deploy command: `uvicorn api:app --host 0.0.0.0 --port $PORT`

### Railway.app
1. Create new project
2. Deploy from GitHub
3. Add environment variables
4. Railway will auto-detect FastAPI app

### Fly.io
1. Install flyctl CLI
2. Run `fly launch` in backend directory
3. Configure secrets with `fly secrets set`
4. Deploy with `fly deploy`
