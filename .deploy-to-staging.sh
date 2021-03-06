#!/bin/bash

# Script generated by Chef; changes will be overwritten.
# Deploys from dev to staging.

cd /var/www/yourhealthidaho.org/releases/dafa58a7c9a822a91936f9da8e40b1f484b57196
date "+%Y-%m-%d %H:%M:%S" > version.txt && # Ensures that a commit can be made to trigger a DB transfer \
mysqldump --single-transaction "wordpress" > .wordpress.sql && \
git add -A && \
git commit -m "auto-commit of development updates" && \
git push -f origin deploy:master
git push -f origin deploy:staging
