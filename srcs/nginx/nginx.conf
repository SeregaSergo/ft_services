server {
    listen				443 ssl;
	listen				[::]:443 ssl;
    ssl_certificate		/etc/ssl/cert.crt;
    ssl_certificate_key	/etc/ssl/cert.key;
	root				/var/www/bswag_site.com;
	index				page.html;
		
	location / {
		try_files $uri $uri/ =404;
	}
}

server {
    listen 80;
	listen [::]:80;
	return 301 https://$host$request_uri;
}
