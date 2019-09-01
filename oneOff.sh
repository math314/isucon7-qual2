#!/usr/bin/env bash

REMOTE="ali-isu1"

mkdir nginx mysql
scp nginx/nginx.conf nginx/nginx.conf
scp -r ${REMOTE}:/etc/mysql/conf.d mysql/conf.d
scp -r ${REMOTE}:/etc/mysql/mysql.conf.d mysql/mysql.conf.d


