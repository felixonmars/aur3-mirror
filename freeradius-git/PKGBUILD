# Maintainer: Phil Pirozhkov

pkgname=freeradius-git
_pkgbase=freeradius
pkgver=3.0.0
pkgrel=5
pkgdesc="The premier open source RADIUS server - patched to support KCRAP authentication for MSCHAPv2 against MIT Kerberos"
arch=('i686' 'x86_64')
url="http://www.freeradius.org/"
license=("GPL")
provides=('freeradius')
depends=('openssl' 'krb5' 'pth' 'libldap>=2.4.18' 'net-snmp' 'pam'
  'postgresql-libs>=9.0.3' 'libtool' 'libmysqlclient' 'gdbm' 'shadow')
makedepends=('git')
optdepends=('libpcap' 'unixodbc' 'python2')
options=('!libtool' 'emptydirs' '!makeflags')
conflicts=('freeradius')
# install=${_pkgbase}.install
source=(git://git.freeradius.org/freeradius-server.git)
sha1sums=('SKIP')
build() {
  cd $srcdir/freeradius-server
  export CFLAGS="$CFLAGS -fno-strict-aliasing"
  echo rlm_ruby >> src/modules/stable
  ./configure --with-system-libtool --with-system-libltdl \
    --prefix=/usr \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --libdir=/usr/lib/freeradius
  make
}

package() {
  cd $srcdir/freeradius-server
  make install R=$pkgdir
  #install -D -m755 ../radiusd $pkgdir/etc/rc.d/radiusd
  chmod o+r $pkgdir/etc/raddb/*
  mv $pkgdir/etc/raddb $pkgdir/etc/raddb.default
  rm -rf $pkgdir/var/run
}
