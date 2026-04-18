#php artisan serve --host=0.0.0.0 --port=8000 >/dev/null &

#rsync -avL --progress -e "ssh -i ~/.ssh/Linux-CodeCambat.pem"  --exclude "vendor" --exclude "storage" ~/git/kalepa/*  ec2-user@platform.datap.ai:/var/www/kalepa/
# --delete REMOVED (2026-04-18): caused file losses on EC2. Additive sync only.
rsync -avL --progress -e "ssh -i ~/.ssh/Linux-CodeCambat.pem"  --exclude "storage" ~/git/kalepa/*  ec2-user@test.datap.ai:/var/www/kalepa/

#npm run watch-poll 
