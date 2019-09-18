#!bin/sh

service mysql start
service nginx start

cd /server/lib
npm run dev
