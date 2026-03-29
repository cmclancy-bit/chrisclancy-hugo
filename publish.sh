#!/bin/bash

echo "📝 Committing changes to Git..."
git add .
git commit -m "publish: $(date '+%Y-%m-%d %H:%M')"
git push origin main

echo "🔨 Building site..."
hugo --minify

if [ $? -ne 0 ]; then
  echo "❌ Build failed. Fix the errors above before deploying."
  exit 1
fi

echo "🚀 Deploying to Cloudflare Pages..."
npx wrangler pages deploy public --project-name chrisclancy-hugo --commit-dirty=true

echo "✅ Done! Your site is live at https://chrisclancy.com"
