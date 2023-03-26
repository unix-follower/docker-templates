openssl req -new -x509 \
    -keyout example-ca-1-private.crt \
    -out example-ca-1-public.crt \
    -days 365 \
    -subj '/CN=ca1.example.com/OU=Demo/O=Example/L=Gomel/C=BY' \
    -passin pass:demo \
    -passout pass:demo

# ---------------------- Kafka PKCS12 (pfx) -----------------------------------

keytool -genkey -noprompt \
    -alias truststore-private-key \
    -dname "CN=kf.example.com, OU=Demo, O=Example, L=Gomel, C=BY" \
    -keystore kafka-truststore.pfx \
    -storetype PKCS12 \
    -keyalg RSA \
    -storepass example \
    -keypass example

keytool -import \
    -alias CARoot \
    -keystore kafka-truststore.pfx \
    -storetype PKCS12 \
    -file example-ca-1-public.crt \
    -storepass example \
    -keypass example

keytool -genkey -noprompt \
    -alias keystore-private-key \
    -dname "CN=kf.example.com, OU=Demo, O=Example, L=Gomel, C=BY" \
    -keystore kafka-keystore.pfx \
    -storetype PKCS12 \
    -keyalg RSA \
    -storepass example \
    -keypass example

keytool -certreq -alias keystore-private-key \
    -keystore kafka-keystore.pfx \
    -file kf.example.com.csr \
    -storepass example \
    -keypass example

openssl x509 -req \
    -CA example-ca-1-public.crt \
    -CAkey example-ca-1-private.crt \
    -CAcreateserial -passin pass:demo \
    -in kf.example.com.csr \
    -out kf.example.com.crt \
    -days 9999

keytool -import \
    -alias kf.example.com \
    -keystore kafka-keystore.pfx \
    -storetype PKCS12 \
    -file kf.example.com.crt \
    -storepass example \
    -keypass example

# ---------------------- Kafka JKS -----------------------------------

keytool -genkey -noprompt \
    -alias truststore-private-key \
    -dname "CN=kf.example.com, OU=Demo, O=Example, L=Gomel, C=BY" \
    -keystore kafka-truststore.jks \
    -keyalg RSA \
    -storepass example \
    -keypass example

keytool -import \
    -alias CARoot \
    -keystore kafka-truststore.jks \
    -file example-ca-1-public.crt \
    -storepass example \
    -keypass example

keytool -genkey -noprompt \
    -alias keystore-private-key \
    -dname "CN=kf.example.com, OU=Demo, O=Example, L=Gomel, C=BY" \
    -keystore kafka-keystore.jks \
    -keyalg RSA \
    -storepass example \
    -keypass example

keytool -certreq -alias keystore-private-key \
    -keystore kafka-keystore.jks \
    -file jks-kf.example.com.csr \
    -storepass example \
    -keypass example

openssl x509 -req \
    -CA example-ca-1-public.crt \
    -CAkey example-ca-1-private.crt \
    -CAcreateserial -passin pass:demo \
    -in jks-kf.example.com.csr \
    -out jks-kf.example.com.crt \
    -days 9999

keytool -import \
    -alias kf.example.com \
    -keystore kafka-keystore.jks \
    -file jks-kf.example.com.crt \
    -storepass example \
    -keypass example


# ---------------------- Kafka producer -----------------------------------

keytool -genkey -noprompt \
    -alias keystore-private-key \
    -dname "CN=kf-client.example.com, OU=Demo, O=Example, L=Gomel, C=BY" \
    -keystore kafka-producer-keystore.pfx \
    -storetype PKCS12 \
    -keyalg RSA \
    -storepass example \
    -keypass example

keytool -certreq -alias keystore-private-key \
    -keystore kafka-producer-keystore.pfx \
    -file kf-producer.example.com.csr \
    -storepass example \
    -keypass example

openssl x509 -req \
    -CA example-ca-1-public.crt \
    -CAkey example-ca-1-private.crt \
    -CAcreateserial -passin pass:demo \
    -in kf-producer.example.com.csr \
    -out kf-producer.example.com.crt \
    -days 9999

keytool -import \
    -alias kf-producer.example.com \
    -keystore kafka-producer-keystore.pfx \
    -storetype PKCS12 \
    -file kf-producer.example.com.crt \
    -storepass example \
    -keypass example
