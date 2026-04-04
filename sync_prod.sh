#php artisan serve --host=0.0.0.0 --port=8000 >/dev/null &

rsync -avL --delete --progress -e "ssh -i ~/.ssh/Linux-CodeCambat.pem"  --exclude "vendor" --exclude "node_modules/*"  --exclude "storage" ~/git/datapai/*  ubuntu@13.238.21.20:~/codepai/

#npm run watch-poll 
