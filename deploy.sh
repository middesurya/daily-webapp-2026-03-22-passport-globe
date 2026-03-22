#!/bin/bash
# Passport Globe — Deployment Script
# Run this from INSIDE the project directory on your local machine
# Prerequisites: gh auth login, vercel login

set -e

PROJECT_NAME="daily-webapp-2026-03-22-passport-globe"
DESCRIPTION="Interactive 3D globe visualizing visa-free travel destinations by passport — Built autonomously with Claude Code"

echo "🌍 Deploying Passport Globe..."

# Ensure we're in the project directory
if [ ! -f "index.html" ]; then
    echo "❌ Error: Run this script from inside the project directory"
    exit 1
fi

# 1. Git init (if not already)
if [ ! -d ".git" ]; then
    git init
    git branch -m main
    git add -A
    git commit -m "feat: Passport Globe — interactive 3D visa-free travel visualizer"
fi

# 2. Create GitHub repo and push
echo "📦 Creating GitHub repo..."
gh repo create "middesurya/$PROJECT_NAME" \
    --public \
    --source=. \
    --remote=origin \
    --push \
    --description "$DESCRIPTION"

# 3. Add topics
echo "🏷️  Adding topics..."
gh repo edit "middesurya/$PROJECT_NAME" \
    --add-topic "daily-webapp" \
    --add-topic "ai-built" \
    --add-topic "claude-code" \
    --add-topic "poc" \
    --add-topic "passport" \
    --add-topic "travel"

# 4. Deploy to Vercel
echo "🚀 Deploying to Vercel..."
DEPLOY_URL=$(vercel --yes --prod 2>&1 | grep "https://" | tail -1)
echo "✅ Deployed to: $DEPLOY_URL"

# 5. Update README with live URL
sed -i "s|\[vercel-url\]|$DEPLOY_URL|g" README.md

# 6. Update GitHub repo with homepage
gh repo edit "middesurya/$PROJECT_NAME" --homepage "$DEPLOY_URL"
gh repo edit "middesurya/$PROJECT_NAME" --description "$DESCRIPTION | Live: $DEPLOY_URL"

# 7. Commit and push updated README
git add README.md
git commit -m "docs: add Vercel deployment URL"
git push

echo ""
echo "✅ Deployment complete!"
echo "📦 GitHub: https://github.com/middesurya/$PROJECT_NAME"
echo "🌐 Live:   $DEPLOY_URL"
