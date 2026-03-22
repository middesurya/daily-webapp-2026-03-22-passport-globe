# Passport Globe - Windows PowerShell Deployment Script
# Run this from INSIDE the project directory
# Prerequisites: gh auth login, npm install -g vercel, vercel login

$ErrorActionPreference = "Stop"

$PROJECT_NAME = "daily-webapp-2026-03-22-passport-globe"
$DESCRIPTION = "Interactive 3D globe visualizing visa-free travel destinations by passport - Built autonomously with Claude Code"

Write-Host "Deploying Passport Globe..." -ForegroundColor Cyan

# Ensure we're in the project directory
if (-not (Test-Path "index.html")) {
    Write-Host "Error: Run this script from inside the project directory" -ForegroundColor Red
    exit 1
}

# 1. Git init (if not already)
if (-not (Test-Path ".git")) {
    git init
    git branch -m main
    git add -A
    git commit -m "feat: Passport Globe - interactive 3D visa-free travel visualizer"
}

# 2. Stage and commit any new changes
git add -A
$hasChanges = git status --porcelain
if ($hasChanges) {
    git commit -m "feat: Passport Globe - interactive 3D visa-free travel visualizer"
}

# 3. Create GitHub repo and push
Write-Host "Creating GitHub repo..." -ForegroundColor Yellow
gh repo create "middesurya/$PROJECT_NAME" --public --source=. --remote=origin --push --description "$DESCRIPTION"

# 4. Add topics
Write-Host "Adding topics..." -ForegroundColor Yellow
gh repo edit "middesurya/$PROJECT_NAME" --add-topic "daily-webapp" --add-topic "ai-built" --add-topic "claude-code" --add-topic "poc" --add-topic "passport" --add-topic "travel"

# 5. Deploy to Vercel
Write-Host "Deploying to Vercel..." -ForegroundColor Yellow
$DEPLOY_OUTPUT = vercel --yes --prod 2>&1
$DEPLOY_URL = ($DEPLOY_OUTPUT | Select-String "https://") | Select-Object -Last 1
$DEPLOY_URL = $DEPLOY_URL.ToString().Trim()
Write-Host "Deployed to: $DEPLOY_URL" -ForegroundColor Green

# 6. Update README with live URL
(Get-Content README.md) -replace '\[vercel-url\]', $DEPLOY_URL | Set-Content README.md

# 7. Update GitHub repo with homepage
gh repo edit "middesurya/$PROJECT_NAME" --homepage "$DEPLOY_URL"
gh repo edit "middesurya/$PROJECT_NAME" --description "$DESCRIPTION | Live: $DEPLOY_URL"

# 8. Commit and push updated README
git add README.md
git commit -m "docs: add Vercel deployment URL"
git push

Write-Host ""
Write-Host "Deployment complete!" -ForegroundColor Green
Write-Host "GitHub: https://github.com/middesurya/$PROJECT_NAME" -ForegroundColor Cyan
Write-Host "Live:   $DEPLOY_URL" -ForegroundColor Cyan
