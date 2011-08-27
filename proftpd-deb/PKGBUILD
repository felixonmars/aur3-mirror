# Maintainer: Mark Constable <markc@renta.net>

pkgname=proftpd-deb
pkgver=1.3.2rc1
pkgrel=1
pkgdesc="ProFTPD server (Debian layout) built with all modules plus SQLite"
arch=(i686 x86_64)
url="http://www.proftpd.org"
conflicts=(proftpd)
provides=(proftpd)
license=(GPL)
backup=(etc/proftpd/proftpd.conf etc/proftpd/modules.conf)
depends=(glibc pam ncurses postgresql-libs libmysqlclient sqlite3)
source=(
  ftp://ftp.proftpd.org/distrib/source/proftpd-$pkgver.tar.gz
  http://www.castaglia.org/proftpd/modules/proftpd-mod-sql-sqlite-0.2.tar.gz
  proftpd
  proftpd.logrotate
  modules.conf
  proftpd.conf
  mod_sql_mysql.c.patch
  add_timer.patch
)

build() {
  cd $srcdir/proftpd-$pkgver
  cp $srcdir/mod_sql_sqlite/mod_sql_sqlite.c contrib
  patch -Np2 -i $srcdir/mod_sql_mysql.c.patch || return 1
  patch -Np2 -i $srcdir/add_timer.patch || return 1
  ./configure LIBS=-lcrypto \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --sysconfdir=/etc/proftpd \
    --localstatedir=/var/run \
    --libexecdir=/usr/lib/proftpd \
    --enable-sendfile --enable-facl --enable-dso --disable-pam --enable-ipv6 --enable-ctrls \
    --with-includes=$(pg_config --includedir) --enable-autoshadow --with-modules=mod_readme \
    --with-shared=mod_quotatab:mod_sql:mod_sql_sqlite:mod_sql_mysql:mod_sql_postgres:mod_quotatab_sql:mod_ldap:mod_quotatab_ldap:mod_ratio:mod_tls:mod_rewrite:mod_radius:mod_wrap:mod_quotatab_file:mod_facl:mod_ctrls_admin:mod_ifsession
  make || return 1
  make DESTDIR=$pkgdir install

  install -D -m644 ../proftpd.logrotate $pkgdir/etc/logrotate.d/proftpd
  mkdir -p $pkgdir/{etc/rc.d,etc/proftpd,var/log/proftpd,usr/lib/proftpd}
  install -m755 proftpd $pkgdir/etc/rc.d
  install -m755 proftpd.conf modules.conf $pkgdir/etc/proftpd
  install -m644 modules/*.o $pkgdir/usr/lib/proftpd
}
md5sums=('e017918f5dcbb58b1de159a162fc796a'
         'f1905d0db906eccc07e0ab07aa91c6d3'
         '66b1993aa80fe3fe6c063ee1e7cc1250'
         'ddb09eb13131becdf0e081eef413116b'
         'dc700279119eddb10748435ee20b4f83'
         '3597fd7e5cc5d2a93f13df96d2203038'
         '949094c52275cd63a5d5e5e96cf25bfc'
         '382329db665f3e28cbba8334a4de9a74')

