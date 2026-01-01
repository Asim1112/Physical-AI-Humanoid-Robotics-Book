# 🚀 Quick Deployment Guide

Fast-track deployment for the RAG Chatbot (Hackathon Ready)

## ⚡ Quick Start (30 minutes)

### Part 1: Backend → Hugging Face Spaces (15 min)

1. **Create Space**
   - Go to https://huggingface.co/new-space
   - Name: `rag-chatbot-backend`
   - SDK: **Docker**
   - Click "Create Space"

2. **Add Secrets** (Settings → Repository secrets)
   ```
   NEON_DATABASE_URL=***********************************************************************
   GROQ_API_KEY=***********************************************************************
   COHERE_API_KEY=***********************************************************************
   QDRANT_URL=***********************************************************************
   QDRANT_API_KEY=***********************************************************************
   QDRANT_COLLECTION_NAME=humanoid-robotics-textbook
   FRONTEND_URL=https://YOUR-APP.vercel.app
   ```
   **Note**: Update FRONTEND_URL after deploying frontend

3. **Upload Files**
   - Click "Files" → "Add file" → "Upload files"
   - Upload from `F:\Humanoid-Robotics-Hackathon\backend\`:
     - All `.py` files (api.py, db.py, models.py, agent.py, retrieve.py, embedding.py, storage.py)
     - Dockerfile
     - .dockerignore
     - requirements.txt
   - **DO NOT** upload: .env, venv/, test_chat_api.py

4. **Wait for Build** (~5 min)
   - Status should show "Running" when done
   - Your URL: `https://YOUR_USERNAME-rag-chatbot-backend.hf.space`

5. **Test**
   ```bash
   curl https://YOUR_USERNAME-rag-chatbot-backend.hf.space/health
   # Should return: {"status":"ok","timestamp":...}
   ```

---

### Part 2: Frontend → Vercel (15 min)

1. **Push to GitHub** (if not already)
   ```bash
   cd F:\Humanoid-Robotics-Hackathon
   git add .
   git commit -m "Ready for deployment"
   git push origin main
   ```

2. **Import to Vercel**
   - Go to https://vercel.com/new
   - Import your GitHub repo
   - **Root Directory**: `frontend`
   - **Framework**: Docusaurus 2

3. **Environment Variables**
   Add in Vercel project settings:
   - Name: `REACT_APP_API_URL`
   - Value: `https://YOUR_USERNAME-rag-chatbot-backend.hf.space`
   - Environments: Production, Preview

4. **Deploy**
   - Click "Deploy"
   - Wait ~3 minutes
   - Your URL: `https://your-project.vercel.app`

5. **Update Backend CORS**
   - Go back to HF Spaces → Settings → Secrets
   - Update `FRONTEND_URL` to your Vercel URL
   - Space will auto-rebuild (~5 min)

---

## ✅ Testing Checklist

Visit your Vercel URL:

- [ ] Page loads successfully
- [ ] Chat button (💬) appears in bottom-right
- [ ] Click chat button - widget opens
- [ ] Send message: "What is ROS 2?"
- [ ] Response appears within 5 seconds
- [ ] Refresh page - chat history persists
- [ ] Highlight text → Send "Explain this" → See selected text indicator
- [ ] Open DevTools Console (F12) - no CORS errors

---

## 🎯 Demo URLs

After deployment, you'll have:

```
Frontend: https://your-project.vercel.app
Backend:  https://YOUR_USERNAME-rag-chatbot-backend.hf.space
API Docs: https://YOUR_USERNAME-rag-chatbot-backend.hf.space/docs
```

Share the frontend URL for hackathon evaluation!

---

## 🔧 Quick Fixes

**CORS Error:**
```
1. Check FRONTEND_URL in HF Spaces matches Vercel URL exactly
2. Rebuild HF Space after updating
3. Clear browser cache
```

**Chat widget not appearing:**
```
1. Check browser console for errors
2. Verify REACT_APP_API_URL is set in Vercel
3. Redeploy frontend
```

**Backend 500 errors:**
```
1. Check HF Spaces Logs tab
2. Verify all secrets are set correctly
3. Test database connection
```

---

## 📝 Full Documentation

See `DEPLOYMENT.md` and `backend/README_DEPLOYMENT.md` for detailed guides.
