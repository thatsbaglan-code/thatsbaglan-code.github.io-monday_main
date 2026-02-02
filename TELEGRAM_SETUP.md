# Telegram Mini App Configuration for GitHub Pages

This app is configured to run as a Telegram Mini App hosted on GitHub Pages.

## Setup Instructions

### 1. Repository Configuration
- Ensure your GitHub repository is public
- Go to Settings → Pages
- Select "Deploy from a branch"
- Choose "main" branch and "/root" folder
- Your site will be available at: `https://<username>.github.io/<repo-name>`

### 2. Telegram Mini App Integration

To set up this as a Telegram Mini App:

1. **Register Bot with BotFather**
   - Message @BotFather on Telegram
   - Create a new bot and get the token

2. **Add Web App to Bot**
   - In BotFather, use `/mybots` → select your bot → Bot Settings → Menu Button
   - Set the Web App URL to your GitHub Pages URL: `https://<username>.github.io/<repo-name>`

3. **Optional: Use Telegram Web App SDK**
   Add the following to your `web/index.html` before `<script src="main.dart.js"></script>`:
   ```html
   <script src="https://telegram.org/js/telegram-web-app.js"></script>
   ```

### 3. Access the Mini App
- Open the bot in Telegram
- Click the menu button to access your web app

## Building and Deploying

Automatic deployment is configured via GitHub Actions. Simply push to the `main` branch:

```bash
git add .
git commit -m "Update app"
git push origin main
```

The workflow will automatically:
1. Build the Flutter web app
2. Deploy to GitHub Pages

## Notes

- Build time may take 2-5 minutes
- Changes will be live at your GitHub Pages URL
- Telegram caches the Web App, you may need to refresh or re-open

## Learn More

- [Telegram Web App Documentation](https://core.telegram.org/bots/webapps)
- [Flutter Web Documentation](https://flutter.dev/docs/get-started/web)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
