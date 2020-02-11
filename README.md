# ngx-autoindex-simple

A tiny docker image with nginx running in autoindex mode.
With very simple and lightweight styling applied via XSLT.

## try it out

Clone this repository, create a folder `html` inside and `make run`. Then check out http://localhost:10800

## use it

Deploy it on your server:

### Docker

Run it directly via Docker:

```
docker run -d -p 10080:80 -v /path/to/public/files:/usr/share/nginx/html:ro ngx-autoindex-simple:latest
```
