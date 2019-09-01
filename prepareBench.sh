#!/usr/bin/env bash

REMOTE="ali-isu1"

ssh ${REMOTE} "sudo systemctl stop nginx.service"
ssh ${REMOTE} "sudo systemctl stop mysql.service"

ssh ${REMOTE} "sudo rm /var/log/nginx/access_tsv.log"
ssh ${REMOTE} "sudo rm /tmp/mysqld-slow.log"

ssh ${REMOTE} "sudo systemctl start nginx.service"
ssh ${REMOTE} "sudo systemctl start mysql.service"
ssh ${REMOTE} "sudo systemctl restart isubata.golang.service"