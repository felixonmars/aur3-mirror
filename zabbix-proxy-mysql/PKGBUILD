# Contributor: Igor Pakhmutov <xasyaip@gmail.com>
pkgname=zabbix-proxy-mysql
pkgver=1.8.3
pkgrel=0
pkgdesc="Software for monitoring of your applications, network and servers."
arch=('i686' 'x86_64')
url="http://www.zabbix.com"
license=('GPL')
depends=('mysql' 'php' 'net-snmp'  'curl' 'php-gd' 'fping')
install=(zabbix-proxy.install)
source=(http://downloads.sourceforge.net/sourceforge/zabbix/zabbix-$pkgver.tar.gz  zabbix_server.conf zabbix_trapper.conf zabbix_proxy.conf zabbix-proxy zabbix-proxy.install)

md5sums=('575c31880d73f6fe41e730874ebfc633'
         '26b0401a83bdb1dce29338e5b2786620'
         '9832a81e134c8e2c11e2a06b7adbf88f'
         '0310b92afb3f35c1075fff53db737212'
         'c03f978d89e825bee44ba4b4de3a0de4 '
         '0c26ace4573e97fbc2657ff4829d72f8')

build() {
  cd $startdir/src/zabbix-$pkgver
  ./configure --prefix=/usr --enable-proxy --with-mysql --with-net-snmp  --with-libcurl
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -d -m0750 $startdir/pkg/var/run/zabbix  $startdir/pkg/var/log/zabbix
  install -d $startdir/pkg/etc/zabbix 
  install -d $startdir/pkg/usr/share/zabbix/dbms/create/data
  install -D -m0640 $startdir/src/zabbix_server.conf $startdir/pkg/etc/zabbix/zabbix_server.conf
  install -D -m0640 $startdir/src/zabbix_trapper.conf $startdir/pkg/etc/zabbix/zabbix_trapper.conf
  install -D -m0755 $startdir/src/zabbix-proxy $startdir/pkg/etc/rc.d/zabbix-proxy
  install -D -m0755 $startdir/src/zabbix-$pkgver/create/schema/mysql.sql $startdir/pkg/usr/share/zabbix/dbms/create/mysql.sql
}
