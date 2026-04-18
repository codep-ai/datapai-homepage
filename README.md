# datapai-homepage

Landing page for **datap.ai** — the DATAP.AI platform homepage.

Express.js + EJS templates, served on port 3002.

## Architecture

```
datap.ai (this repo — landing page)
├── stock.datap.ai    → datapai-stock-fe + datapai-stock-be
├── health.datap.ai   → datapai-healthcare-fe + datapai-healthcare-be
└── platform.datap.ai → datapai-platform-fe + datapai-platform-be
```

## Local Development

```bash
npm install
node index.js
# http://localhost:3002
```

## EC2 Deployment

**Server:** ubuntu@13.238.21.20 (datap.ai)
**SSH:** `ssh -i ~/.ssh/Linux-CodeCambat.pem ubuntu@13.238.21.20`
**Path:** `~/datapai_homepage/`
**Process manager:** PM2

### Deploy

```bash
bash sync_homepage.sh
```

### Restart service on EC2

```bash
ssh -i ~/.ssh/Linux-CodeCambat.pem ubuntu@13.238.21.20
pm2 restart datapai-homepage
```

### PM2 Commands

```bash
pm2 list                      # show all processes
pm2 restart datapai-homepage  # restart
pm2 stop datapai-homepage     # stop
pm2 logs datapai-homepage     # view logs
pm2 delete datapai-homepage   # remove process

# If deleted, re-register:
cd ~/datapai_homepage && pm2 start index.js --name datapai-homepage && pm2 save
```

### First-time setup on new EC2

```bash
# Install Node.js via nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
source ~/.bashrc
nvm install 20
nvm use 20

# Install PM2
npm install -g pm2

# Install deps and start
cd ~/datapai_homepage
npm install
pm2 start index.js --name datapai-homepage
pm2 save
pm2 startup   # auto-start on reboot
```

## Tech Stack

- **Runtime:** Node.js (Express.js)
- **Templates:** EJS
- **Port:** 3002
- **Process manager:** PM2
- **Nginx:** Reverse proxy datap.ai → localhost:3002

## Repo Structure

```
views/
  index.ejs          # Homepage
  _menu.ejs          # Nav bar (includes Domains dropdown)
  _header.ejs        # HTML head
  _footer.ejs        # Footer
  genai.ejs          # AI page
  products.ejs       # Products page
  ...
public/
  css/               # Stylesheets
  images/            # Images + GIFs
  js/                # Client-side JS
index.js             # Express server
sync_homepage.sh     # Deploy to EC2
```

## All Repos

| Repo | Purpose | Domain | EC2 |
|------|---------|--------|-----|
| **datapai-homepage** (this) | Landing page | datap.ai | ubuntu@13.238.21.20 |
| datapai-platform-be | Common AI framework | — | ec2-user@platform.datap.ai |
| datapai-platform-fe | Platform frontend | platform.datap.ai | ec2-user@platform.datap.ai |
| datapai-stock-be | Stock backend | — | ec2-user@platform.datap.ai |
| datapai-stock-fe | Stock frontend | stock.datap.ai | ec2-user@platform.datap.ai |
| datapai-healthcare-be | Healthcare backend | — | ec2-user@platform.datap.ai |
| datapai-healthcare-fe | Healthcare frontend | health.datap.ai | ec2-user@platform.datap.ai |
