#!/usr/bin/env bash
REMOTE="ali-isu1"

ssh ${REMOTE} "rm -r /tmp/etc"
ssh ${REMOTE} "mkdir -p /tmp/etc/nginx && mkdir -p /tmp/etc/mysql"

scp nginx/nginx.conf ${REMOTE}:/tmp/etc/nginx
scp -r mysql/conf.d ${REMOTE}:/tmp/etc/mysql
scp -r mysql/mysql.conf.d ${REMOTE}:/tmp/etc/mysql

scp copyFiles.sh ${REMOTE}:/tmp
ssh ${REMOTE} "/tmp/copyFiles.sh"

cd webapp/go
GOOS=linux GOARCH=amd64 make
cd ../..

ssh ${REMOTE} "sudo systemctl stop isubata.golang.service"

scp webapp/go/isubata ${REMOTE}:/home/isucon/isubata/webapp/go/isubata
# scp -r app/src/templates ${REMOTE}:/home/isucon/private_isu/webapp/golang

ssh ${REMOTE} "sudo systemctl restart nginx.service"
ssh ${REMOTE} "sudo systemctl restart mysql.service"

ssh ${REMOTE} "sudo systemctl start isubata.golang.service"