
# thanks to all master & friend member in Mikrotik squid  facebook group speedlink1980


```bash
#installasi complete software 
apt-get update && apt-get upgrade -y
git clone https://github.com/speedlink0/tpproxy.git
cd squid4-autoinstall-notproxy
chmod +x squid4.sh
chmod 777 squid4.sh
./squid4.sh
```

## after reboot 
```bash
squid -k reconfigure
/etc/init.d/squid restart
chown -R nobody /var/lib/squid/ssl_db/
chown -R proxy:proxy /var/lib/squid/ssl_db/
tail -f /var/log/squid/access.log
```

# for mikrotik router setup mangle and ip route for tproxy 
```bash
mikrotik setup external proxy with squid :
/ Ip routes
add gateway = ip proxy
distance = 1
scope = 30
the target scope = 10
routing_mark = via_squid

/ip firewall mangle
add chain = prerouting
dst.address = ! ip proxy / subnet
protocol = tcp
any port = 80.443
in interface = ! proxy
add action = mark-routing
new routing mark = via squid
```
<h1>documentation</h1>

