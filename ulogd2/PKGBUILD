# Maintainer: Andrzej Boreczko <0rion@wp.pl>
# Contributor: Andrzej Boreczko <0rion@wp.pl>

pkgname=ulogd2
pkgver=2.0.0
pkgrel=6
pkgdesc="Userspace Packet Logging for netfilter"
arch=(i686 x86_64)
url="http://www.netfilter.org/projects/ulogd/index.html"
license=('GPL')
depends=('libnetfilter_conntrack>=1.0.0' 'libnetfilter_log>=1.0.0' 'libnfnetlink>=1.0.0' 'libmnl>=1.0.0' 'libnetfilter_acct>=1.0.0')
optdepends=('ulogd2_output_mysql: MySQL output' 'ulogd2_output_pgsql: PostgreSQL output' \
            'ulogd2_output_sqlite3: Sqlite3 output' 'ulogd2_output_pcap: libpcap-style logfiles output' \
            'ulogd2_output_dbi: Libdbi framework output')
conflicts=('ulogd>1.24')
backup=('etc/ulogd2.conf')
source=("http://www.netfilter.org/projects/ulogd/files/ulogd-${pkgver}.tar.bz2" 'ulogd2' 'logrotate')
md5sums=('211e68781e3860959606fc94b97cf22e' '6f776ea51a5143c8a0ec617da9df69a9' 'ca4ac3b29edd3f659b9d9428068d56a4')

build() {
  export MAKEFLAGS="-j1"
  cd $startdir/src/ulogd-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --with-mysql \
    --with-pgsql --with-dbi  --program-suffix=2
  make || return 1
}

package() {
  cd $startdir/src/ulogd-${pkgver}
  make DESTDIR=$startdir/pkg install || return 1
  rm $startdir/pkg/usr/lib/ulogd/*.la
  [ -f $startdir/pkg/usr/lib/ulogd/ulogd_output_MYSQL.so ] && rm $startdir/pkg/usr/lib/ulogd/ulogd_output_MYSQL.* 
  [ -f $startdir/pkg/usr/lib/ulogd/ulogd_output_PGSQL.so ] && rm $startdir/pkg/usr/lib/ulogd/ulogd_output_PGSQL.*
  [ -f $startdir/pkg/usr/lib/ulogd/ulogd_output_SQLITE3.so ] && rm $startdir/pkg/usr/lib/ulogd/ulogd_output_SQLITE3.* 
  [ -f $startdir/pkg/usr/lib/ulogd/ulogd_output_PCAP.so ] && rm $startdir/pkg/usr/lib/ulogd/ulogd_output_PCAP.*
  [ -f $startdir/pkg/usr/lib/ulogd/ulogd_output_DBI.so ] && rm $startdir/pkg/usr/lib/ulogd/ulogd_output_DBI.*
  install -D -m755 $startdir/src/ulogd2 $startdir/pkg/etc/rc.d/ulogd2
  sed 's/\/var\/log\/ulogd.log/\/var\/log\/ulogd2.log/' ulogd.conf > $startdir/pkg/etc/ulogd2.conf
  mkdir -p $startdir/pkg/usr/share/ulogd2
  install -m644 doc/*.table $startdir/pkg/usr/share/ulogd2
  install -m644 doc/*.sql $startdir/pkg/usr/share/ulogd2
  install -D -m644 ${srcdir}/logrotate $pkgdir/etc/logrotate.d/ulogd2
}
