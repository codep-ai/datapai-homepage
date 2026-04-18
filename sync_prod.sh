#php artisan serve --host=0.0.0.0 --port=8000 >/dev/null &

# --delete REMOVED (2026-04-18): caused file losses on EC2. Additive sync only.
rsync -avL --progress -e "ssh -i ~/.ssh/Linux-CodeCambat.pem"  --exclude "vendor" --exclude "node_modules/*"  --exclude "storage" ~/git/datapai/*  ubuntu@13.238.21.20:~/codepai/

#npm run watch-poll 
