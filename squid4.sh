#!/bin/bash
JAM=`date +%H`
MENIT=`date +%M`
blue='\e[1;34m'
green='\e[0;23m'
purple='\e[1;35m'
cyan='\e[1;36m'
red='\e[1;31m'

echo -e $purple
echo -e " _       _____ ______  _     _ _    _    ______         ______  
| |     (_____)  ___ \| |   | \ \  / /  |  ___ \   /\  |  ___ \ 
| |        _  | |   | | |   | |\ \/ /   | | _ | | /  \ | |   | |
| |       | | | |   | | |   | | )  (    | || || |/ /\ \| |   | |
| |_____ _| |_| |   | | |___| |/ /\ \   | || || | |__| | |   | |
|_______|_____)_|   |_|\______/_/  \_\  |_||_||_|______|_|   |_|
                                                                
                                       \n\n\n";
echo -e $cyan
read -p 'Masukan User Linux Anda: ' userver
read -sp 'password Linux Anda:' passserver 
echo "selamatkan dunia"
echo -e "selamat datang $userver ashole di program installasi server\n"
echo -e "Sekarang jam" $JAM:$MENIT
echo -e $red 
cal
echo -n "Masukan Nama Anda :"
read nama
echo -e $red[+] $cyan"$HOSTNAME uptime is "$red[+]$cyan;uptime
echo -e Hello $blue $nama $green you are $red ashole
echo -e $blue how are you $blue $nama
echo -e $blue oh iya ... !sebelumnya clone dari $red github git clone https://github.com/puji122/squid4-autoinstall.git
echo -e $cyan
echo "|=====================================================|"
echo "|                   Sajak Suara                       |"
echo "|=====================================================|"
echo "|     sesungguhnya suara itu tak bisa diredam         |"
echo "|                mulut bisa dibungkam                 |"
echo "|  namun siapa mampu menghentikan nyanyian bimbang    |"
echo "|    dan pertanyaan-pertanyaan dari lidah jiwaku      |"
echo "|      suara-suara itu tak bisa dipenjarakan          |"
echo "|          di sana bersemayam kemerdekaan             |"
echo "|           apabila engkau memaksa diam               |"
echo "|       akan kusiapkan untukmu: pemberontakan!        |"
echo "|                                                     |"
echo "|        sesungguhnya suara itu bukan perampok        |"
echo "|             yang ingin meraih hartamu               |"
echo "|                 ia ingin bicara                     |"
echo "|            mengapa kau kokang senjata               |"
echo "|         dan gemetar ketika suara-suara itu          |"
echo "|                menuntut keadilan?                   |"
echo "|                                                     |"
echo "|       sesungguhnya suara itu akan menjadi kata      |"
echo "|          ialah yang mengajari aku bertanya          |"
echo "|          dan pada akhirnya tidak bisa tidak         |"
echo "|                engkau harus menjawabnya             |"
echo "|            apabila engkau tetap bertahan            |"
echo "|         aku akan memburumu seperti kutukan          |"
echo "|           Wiji Thukul - 1996 (Sajak Suara)          |"
echo "|=====================================================|"
echo -e $purple Selamat datang di installasi server
while true; do
    read -p "Lanjutkan installasi?" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Tolong jawab yes atau no";;
    esac
done

# informasi perangkat keras
echo "++ Perangkat keras "
CPU=`grep "model name" /proc/cpuinfo | head -n 1 | cut -f 2 -d ':'`
RAM=`grep "MemTotal" /proc/meminfo | cut -f 2 -d ':'`
echo " |- CPU : " $CPU
echo " |- RAM : " $RAM
echo "++ Sistem Operasi "
# informasi sistem operasi
OS=`uname -sr`
echo " |- OS : " $OS
echo " |- Shell : " $SHELL --version
echo -n "Waktu system   :"; date
echo -n "Distro Info    :"; lsb_release -a
echo -n "Anda           :"; whoami
echo -n "Banyak pemakai :"; who | wc -l
echo "ok langsung ajah"
echo "sambil ngopi brayy duduk yang manis yah"

echo -e $cyan
cp sysctl.conf /etc/
cp limits.conf /etc/security/

apt-get update && apt-get upgrade -y

echo -e "Install WebServer \n"
apt-get install apache2 -y
echo "ServerName localhost" >> /etc/apache2/apache2.conf
service apache2 restart
apt-get install php5 php5-mysql mysql-server -y 
apt-get install phpmyadmin -y
echo -e "WebServer Telah Selesai di install, \n"
while true; do
    read -p "Lanjuut?" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "jawab aja yes atau no";;
    esac
done
echo -e "memulai installasi proxy server"
apt-get install devscripts build-essential openssl libssl-dev fakeroot libcppunit-dev pkg-config libsasl2-dev cdbs ebtables bridge-utils libcap2 libcap-dev libcap2-dev sysv-rc-conf iproute kernel-package libncurses5-dev fakeroot wget bzip2 debhelper linuxdoc-tools libselinux1-dev htop iftop dnstop perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python ccze pastebinit checkinstall libssl-dev htop iftop iptraf mtr-tiny bwm-ng ccze sysv-rc-conf devscripts build-essential openssl libssl-dev fakeroot libcppunit-dev libsasl2-dev cdbs ccze libfile-readbackwards-perl libcap2 libcap-dev libcap2-dev libnetfilter-conntrack-dev libfile-readbackwards-perl -y   
tar -xzf libecap-1.0.0.tar.gz
cd libecap-1.0.0
./configure && make && make install
echo '/usr/local/lib' >> /etc/ld.so.conf
ldconfig

cd -
tar zxvf ecap_mamamyuk.tar.gz
cd ecap_adapter_sample-1*
./configure && make && make install

cd -
echo -e $red
tar -xzvf squid-4.0.4.tar.gz
cd squid-4.0.4
./configure '--prefix=/usr' '--bindir=/usr/bin' '--sbindir=/usr/sbin' '--libexecdir=/usr/lib/squid' '--sysconfdir=/etc/squid' '--localstatedir=/var' '--libdir=/usr/lib' '--includedir=/usr/include' '--datadir=/usr/share/squid' '--infodir=/usr/share/info' '--mandir=/usr/share/man' '--disable-dependency-tracking' '--disable-strict-error-checking' '--enable-async-io=24' '--with-aufs-threads=24' '--with-pthreads' '--enable-storeio=aufs,diskd' '--enable-removal-policies=lru,heap' '--with-aio' '--with-dl' '--enable-icmp' '--enable-esi' '--disable-icap-client' '--disable-wccp' '--disable-wccpv2' '--enable-kill-parent-hack' '--enable-cache-digests' '--disable-select' '--enable-http-violations' '--enable-linux-netfilter' '--enable-follow-x-forwarded-for' '--disable-ident-lookups' '--enable-x-accelerator-vary' '--enable-zph-qos' '--with-default-user=proxy' '--with-logdir=/var/log/squid' '--with-pidfile=/var/run/squid.pid' '--with-swapdir=/cache/cache' '--with-openssl' '--with-large-files' '--enable-ltdl-convenience' '--with-filedescriptors=65536' '--with-maxfd=65536' '--enable-storeid-rewrite-helpers' '--enable-snmp' '--enable-referer-log' '--enable-ecap' '--enable-ssl-crtd' '--enable-err-languages=English' '--enable-default-err-language=English' '--build=x86_64' 'build_alias=x86_64' 'PKG_CONFIG_PATH=/usr/local/lib/pkgconfig'
make && make install

cd -
cp squid.conf /etc/squid/
cp store-id.pl /etc/squid/
cp blok.txt /etc/squid/
cp ad_block.txt /etc/squid/
cp squid /etc/init.d/
cp blok.html /var/www/

cd /etc/init.d/
chmod +x /etc/init.d/squid
update-rc.d squid defaults
/etc/init.d/squid stop

cd -
chmod +x /etc/squid/store-id.pl
chmod +x /etc/squid/ad_block.txt
chmod +x /etc/squid/blok.txt
chmod +x /etc/init.d/squid
chown -R proxy:proxy /cache/cache/
chmod -R 777 /cache/cache/

cd /var/log/squid/
touch access.log 
touch cache.log

cd
chown -R proxy:proxy /var/log/squid/
chmod -R 777 /var/log/squid/
mkdir /etc/squid/ssl_certs/

echo -e $blue
cd /etc/squid/ssl_certs/
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=ID/ST=WestJava/L=Bandung/O=puji122/OU=Proxy Server/CN=Puji Ermanto/emailAddress=pujiermanto@gmail.com" -keyout pujiermanto.pem  -out pujiermanto.pem
openssl x509 -in pujiermanto.pem -outform DER -out pujiermanto.der

cd
mkdir /var/lib/squid
/usr/lib/squid/ssl_crtd -c -s /var/lib/squid/ssl_db
chown -R proxy:proxy /etc/squid/
chmod -R 777 /etc/squid/
chown -R nobody /var/lib/squid/ssl_db
chown -R proxy:proxy /var/lib/squid/ssl_db

echo "================================================================================================================================"
echo "setelah reboot"
echo "squid -k reconfigure"
echo "/etc/init.d/squid restart"
echo "byee ashole"
echo "tail -f /var/log/squid/access.log | ccze"
echo "buat direktory cache, pastikan sebelumnya sudah di sesuaikan untuk direktori /cache nya sesuai dengan kapasitas hardisk anda"
echo -e $purple
squid -z
echo -e $red
echo "selesai_"
echo -e $green
echo -e "Selamat installasi squid proxy version4 telah selesai di laksanakan. , \nHarap Restart dulu server anda."
echo -e "Created by : Puji Ermanto aka mamam-yuk aka younghipster http://younghipster.comli.com/"
echo "================================================================================================================================"
while true; do
    read -p "Silahkan Direstart bro?" yn
    case $yn in
        [Yy]* ) init 6; break;;
        [Nn]* ) exit;;
        * ) echo "jawab aja yes atau no gitu ajah ko repot";;
    esac
done
