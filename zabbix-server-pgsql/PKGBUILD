# Contributor: Igor Pakhmutov <xasyaip@gmail.com>
pkgname=zabbix-server-pgsql
pkgver=1.8.3
pkgrel=0
pkgdesc="Software for monitoring of your applications, network and servers."
arch=('i686' 'x86_64')
url="http://www.zabbix.com"
license=('GPL')
depends=('postgresql' 'php-pgsql' 'php' 'net-snmp' 'iksemel' 'curl' 'php-gd' 'fping')
install=(zabbix-server.install)
source=(http://downloads.sourceforge.net/sourceforge/zabbix/zabbix-$pkgver.tar.gz  zabbix_server.conf zabbix_trapper.conf zabbix_proxy.conf zabbix-server zabbix-server.install)

md5sums=('575c31880d73f6fe41e730874ebfc633'
         '26b0401a83bdb1dce29338e5b2786620'
         '9832a81e134c8e2c11e2a06b7adbf88f'
         '0310b92afb3f35c1075fff53db737212'
         '97ff007a91957b1954ab59149a8b373e'
         '7f8df19ad06b5111142525ffb5e680da')

build() {
  cd $startdir/src/zabbix-$pkgver
  ./configure --prefix=/usr --enable-server --with-pgsql --with-net-snmp --with-jabber --with-libcurl
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -d -m0750 $startdir/pkg/var/run/zabbix  $startdir/pkg/var/log/zabbix
  install -d $startdir/pkg/etc/zabbix 
  install -d $startdir/pkg/usr/share/zabbix/dbms/create/data
  install -d -m0755 $startdir/pkg/srv/http/zabbix
  install -D -m0640 $startdir/src/zabbix_server.conf $startdir/pkg/etc/zabbix/zabbix_server.conf
  install -D -m0640 $startdir/src/zabbix_trapper.conf $startdir/pkg/etc/zabbix/zabbix_trapper.conf
  install -D -m0755 $startdir/src/zabbix-server $startdir/pkg/etc/rc.d/zabbix-server
  install -D -m0755 $startdir/src/zabbix-$pkgver/create/data/data.sql $startdir/pkg/usr/share/zabbix/dbms/create/data/data.sql
  install -D -m0755 $startdir/src/zabbix-$pkgver/create/data/images_pgsql.sql $startdir/pkg/usr/share/zabbix/dbms/create/data/images_pgsql.sql
  install -D -m0755 $startdir/src/zabbix-$pkgver/create/schema/postgresql.sql $startdir/pkg/usr/share/zabbix/dbms/create/postgresql.sql
  cp -r $startdir/src/zabbix-$pkgver/frontends/php/* $startdir/pkg/srv/http/zabbix/
}
