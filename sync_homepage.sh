#php artisan serve --host=0.0.0.0 --port=8000 >/dev/null &

# ═════════════════════════════════════════════════════════════════════════════
# DEPRECATED (2026-04-18):  13.238.21.20 has been DECOMMISSIONED.
# The live homepage is served from datapai-homepage-next on platform.datap.ai
# (13.55.219.134). Do NOT run this script — it will fail on connection refused.
# Retained here only for git-history reference of the old deployment.
# ═════════════════════════════════════════════════════════════════════════════
echo "ERROR: sync_homepage.sh targets decommissioned EC2 (13.238.21.20)." >&2
echo "The live homepage deploys from the datapai-homepage-next repo." >&2
exit 2

# --delete REMOVED (2026-04-18): caused file losses on EC2. Additive sync only.
rsync -avL --progress -e "ssh -i ~/.ssh/Linux-CodeCambat.pem"  --exclude "vendor" --exclude "node_modules/*"  --exclude "storage" ~/git/datapai-homepage/*  ubuntu@13.238.21.20:~/datapai_homepage
#rsync -avL --progress -e "ssh -i ~/.ssh/test_datapai.pem"  --exclude "node_modules/*" --exclude "vendor" --exclude "storage" ~/git/kalepa/*  ec2-user@test.datap.ai:/var/www/kalepa/

#npm run watch-poll 
