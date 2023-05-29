# RateMovies
1..env
2.composer install
3.base de datos
4. probar

conmandos
php bin/console clear:cache 



//htacess
<FilesMatch ".(php4|php5|php3|php2|php|phtml)$">
	SetHandler application/x-lsphp82
</FilesMatch>
RewriteEngine On
RewriteCond %{ENV:HTTPS} !on [NC]
RewriteCond %{QUERY_STRING} !wc-api [NC]
RewriteCond %{HTTP_HOST} ^(www\.)?nuevo.dominio
RewriteRule ^(.*)$ https://nuevo.dominio/$1 [R=301,L,NE]
RewriteCond %{REQUEST_URI} !^public
RewriteRule ^(.*)$ public/$1 [L]