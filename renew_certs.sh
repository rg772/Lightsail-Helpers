#!/bin/bash

# Loop through each directory ending with .edu
for dir in /opt/bitnami/SITES/*.edu; do
# Extract the domain name from the directory path
domain=$(basename "$dir")
echo $domain

  # Execute the given statement with the domain
  sudo /opt/bitnami/letsencrypt/lego --path /opt/bitnami/letsencrypt --email="<YOUR_EMAIL" --http --http-timeout 
30 --http.webroot /opt/bitnami/apps/letsencrypt --domains=$domain --user-agent bitnami-bncert/2.0.0 renew && sudo /opt/bitnami/apache/bin
/httpd -f /opt/bitnami/apache/conf/httpd.conf -k graceful
done
