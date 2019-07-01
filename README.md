

# thanks to all master & friend member in Mikrotik squid Indonesia facebook group 
especially =
<li>om cespun</li>
<li>syaifudin.Jw</li>
<li>Efdika Doank</li>
<li>Uccok Harahap</li>
<li>Teuku Indra Maulana</li>
<li>Gin kyiosiro</li>
<li>adhi proxy</li>
<li>mikrotiker and squid lovers</li>
<li>dhani dhanu</li>
<li>Chairil fadli</li>
<li>Aska Juliadi</li>
<li>Dokter Squid indonesia</li>
and much more ... sorry for all that can not be mentioned above you who have been a little more helpful, thanks
<a href = "https://www.facebook.com/groups/Mikrotik.Squid.Indonesia/">Mikrotik Squid Indonesia Facebook group</a>
# squid4 for autoinstall  No-tproxy-full-manual-input-in your iternet browser
- here I use VirtualBox as a proxy machine
- for use debian7 or debian8  in session to install this squid4 <a href="http://cdimage.debian.org/cdimage/archive/7.11.0/amd64/iso-cd/">Debian7 iso cd </a>
<a href = "http://cdimage.debian.org/debian-cd/8.6.0/amd64/iso-cd/">debian8 iso cd</a> I use amd64 bit
- no tproxy - this is for input manual your web browser
- full manual proxy with ssl_bump
 for tproxy please copy  modules in squid4-autoinstall-notproxy/ to the directory /etc/ ( cp modules /etc/ ),then copy also rc.local file to the directory /etc/ ( cp rc.local /etc/ ), edit the contents of the file rc.local on the ip_addressproxy/subnet replace with your_ipaddressproxy/subnet .
- 
before doing the installation is customized in squid.conf for configuration cache_dir
on the (cache_dir aufs /cache/cache on squid.conf in this folder) ## adjust to your partition
- apt-get install git g++-4.4 -y or g++ for debian8
<h1>Start Installation</h1>
##already finish installation debian or ubuntu server & webserver
start the installation with git clone

```bash
#installasi complete software 
apt-get update && apt-get upgrade -y
git clone https://github.com/puji122/squid4-autoinstall-notproxy.git
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

