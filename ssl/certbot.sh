#!/bin/sh
##################################"
##
##		SCRIPTING BY alexonbstudio | PENDING
##
##################################"

certbot --apache -d dev.alexonbstudio.fr #new install
certbot --nginx -d dev.alexonbstudio.fr #new install

openssl x509 -noout -dates -in /etc/letsencrypt/live/dev.alexonbstudio.fr/cert.pem #know date (before/after expire)

certbot --apache -d dev.alexonbstudio.fr --force-renewal --quiet #forcing renew
certbot --nginx -d dev.alexonbstudio.fr --force-renewal --quiet #forcing renew
certbot renew --dry-run # Test renewal
#Contab -e
#34 5 12 */2 * systemctl stop apache && certbot renew -q && systemctl start apache
#34 5 12 */2 * systemctl stop nginx && certbot renew -q && systemctl start nginx

#####	For custom HOOK		#####
#certbot renew --pre-hook "systemctl stop apache" --post-hook "systemctl start apache"
#certbot renew --pre-hook "systemctl stop nginx" --post-hook "systemctl start nginx"
