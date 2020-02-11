build:
	docker build . -t ngx-autoindex-simple:latest

run: build
	docker run --rm -p 10080:80 -v $(PWD)/html:/usr/share/nginx/html:ro ngx-autoindex-simple:latest
