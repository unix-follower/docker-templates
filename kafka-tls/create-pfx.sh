#!/bin/bash

# Change to your domain name
#openssl pkcs12 -export -out domain.name.pfx -inkey domain.name.key -in domain.name.crt

openssl pkcs12 -export -out example.com.pfx -inkey domain.name.key -in domain.name.crt

openssl pkcs12 -export -out example.com.pfx -inkey kafkacat.client.key -inkey snakeoil-ca-1.key \
  -in broker1-ca1-signed.crt \
  -in broker2-ca1-signed.crt \
  -in broker3-ca1-signed.crt \
  -in consumer-ca1-signed.crt \
  -in producer-ca1-signed.crt \
  -in snakeoil-ca-1.crt
