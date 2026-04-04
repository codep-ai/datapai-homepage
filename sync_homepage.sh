#php artisan serve --host=0.0.0.0 --port=8000 >/dev/null &

rsync -avL --delete --progress -e "ssh -i ~/.ssh/Linux-CodeCambat.pem"  --exclude "vendor" --exclude "node_modules/*"  --exclude "storage" ~/git/datapai-homepage/*  ubuntu@13.238.21.20:~/datapai_homepage
#rsync -avL --delete --progress -e "ssh -i ~/.ssh/test_datapai.pem"  --exclude "node_modules/*" --exclude "vendor" --exclude "storage" ~/git/kalepa/*  ec2-user@test.datap.ai:/var/www/kalepa/

#npm run watch-poll 
