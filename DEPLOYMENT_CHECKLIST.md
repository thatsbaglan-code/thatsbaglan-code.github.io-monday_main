# Deployment Checklist

## ✅ Done
- [x] Flutter web build created (`build/web/`)
- [x] GitHub Actions workflow configured (`.github/workflows/build-and-deploy.yml`)
- [x] Telegram Mini App SDK integrated (`web/index.html`)
- [x] `.nojekyll` file added for proper GitHub Pages deployment
- [x] Telegram setup documentation created

## 📋 Next Steps

### 1. Initialize Git (if not already done)
```bash
cd /Users/bd/codes_folder/monday_main
git init
git add .
git commit -m "Initial commit: Flutter web app with Telegram Mini App support"
```

### 2. Create GitHub Repository
1. Go to https://github.com/new
2. Create a new repository (e.g., `monday-flutter`)
3. Do NOT initialize with README, .gitignore, or license

### 3. Push to GitHub
```bash
git remote add origin https://github.com/<YOUR_USERNAME>/monday-flutter.git
git branch -M main
git push -u origin main
```

### 4. Enable GitHub Pages
1. Go to your repository on GitHub
2. Settings → Pages
3. Select "Deploy from a branch"
4. Choose "main" branch and "/root" folder
5. Wait 1-2 minutes for deployment
6. Your site: `https://<YOUR_USERNAME>.github.io/monday-flutter`

### 5. Set Up Telegram Mini App
1. Message @BotFather on Telegram
2. `/newbot` - Create a new bot and get token
3. `/mybots` → Select your bot → Bot Settings → Menu Button
4. Set Web App URL: `https://<YOUR_USERNAME>.github.io/monday-flutter`

### 6. Test in Telegram
- Open your bot in Telegram
- Click the menu button to see your Mini App

## 📝 File Changes

**Created:**
- `.github/workflows/build-and-deploy.yml` - Auto-deploy on push
- `TELEGRAM_SETUP.md` - Detailed Telegram setup guide
- `.nojekyll` - Tells GitHub Pages not to process with Jekyll
- `DEPLOYMENT_CHECKLIST.md` - This file

**Modified:**
- `web/index.html` - Added Telegram Web App SDK

## 🔄 Future Updates

After pushing to GitHub, future updates are automatic:
1. Make code changes
2. Push to main branch
3. GitHub Actions automatically builds and deploys
4. Changes live in 2-5 minutes

## 🐛 Troubleshooting

### GitHub Pages not updating?
- Wait 2-5 minutes after push
- Hard refresh the page (Cmd+Shift+R on Mac)
- Check Actions tab for build errors

### Telegram not showing Web App?
- Verify bot token is correct in BotFather
- Check URL is accessible in browser first
- Telegram caches Web Apps - try opening in incognito

### Build fails?
- Check GitHub Actions tab for error logs
- Verify Flutter version matches pubspec.yaml
- Run `flutter clean && flutter pub get` locally
