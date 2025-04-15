#!/bin/sh

all_proxy="http://localhost:3128/"
http_proxy="http://localhost:3128/"
https_proxy="https:/localhost:3128/"
ftp_proxy="ftp://localhost:3128/"
socks_proxy="socks://localhost:3128/"
no_proxy="localhost,127.0.0.1,"

HTTP_PROXY="http://localhost:3128/"
HTTPS_PROXY="https:/localhost:3128/"

export all_proxy
export http_proxy
export https_proxy
export ftp_proxy
export socks_proxy
export no_proxy
