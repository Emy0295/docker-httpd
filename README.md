# httpd-docker

## Overview

This docker image contains [httpd](https://httpd.apache.org/) with [cgi](https://en.wikipedia.org/wiki/Common_Gateway_Interface) and [php](https://php.net/).

## Entrypoint Scripts

None.

## Standard Configuration

### Container Layout

```
/
├─ etc/
│  ├─ apache2/
│  │  └─ sites-available/
│  │     └─ 000-default.conf
│  └─ supervisor/
│     └─ config.d/
│        └─ apache2.conf
└─ var/
   └─ www/
      └─ hello/
         ├─ hello.cgi
         ├─ hello.html
         └─ hello.php
```

### Exposed Ports

* `80/tcp` - httpd listening port.

### Volumes

None.

## Development

[Source Control](https://github.com/apifocal/httpd-docker)

