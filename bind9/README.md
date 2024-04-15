#### Install on Mac OS
```shell
brew install bind
```
#### Commands
To start bind now and restart at startup:
```shell
sudo brew services start bind
sudo brew services info bind
sudo brew services stop bind
```
Or, if you don't want/need a background service you can just run:
```shell
/usr/local/opt/bind/sbin/named -f -L /usr/local/var/log/named/named.log
nano /usr/local/etc/bind/named.conf
```
### Miscellaneous
```shell
named-checkzone example.org /etc/bind/example.org
named-checkzone 1.168.192.in-addr.arpa. /etc/bind/example.org.reverse

named-checkzone example.org /etc/bind/example.org
named-checkzone 1.0.0.127.in-addr.arpa. /etc/bind/example.org.reverse

apt update -y
apt install -y dnsutils
apt install -y iputils-ping
apt install -y nano

dig 1.168.192.in-addr.arpa. AXFR

ping -c 2 ns1.example.org
ping -c 2 box.example.org

ping -c 2 ns1.example.org
nslookup ns1.example.org
nslookup 192.168.1.1

ping -c 2 test.example.org
nslookup test.example.org
nslookup 127.0.0.1

zone "test.example.org" {
  type forward;
  forward only;
  forwarders {
    127.0.0.1 port 2053;
  };
};
```
