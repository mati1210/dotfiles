#!/bin/sh
openssl req -x509 -newkey ec -pkeyopt 'ec_paramgen_curve:P-256' \
  -days 3650 -nodes \
  -keyout cert.key -out cert.pem -subj '/CN=whatever.internal' \
  -addext 'subjectAltName=IP:127.0.0.1'
