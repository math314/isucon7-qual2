#!/usr/bin/env bash

REMOTE="ali-isu1"

scp ${REMOTE}:/var/log/nginx/access_tsv.log tmp.log
alp/alp -f tmp.log 
# alp -f tmp.log --aggregates "/posts/,/image/,/@"