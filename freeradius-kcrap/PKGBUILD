# $Id: PKGBUILD 51749 2011-07-14 06:47:41Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jason R Begley (jayray@digitalgoat.com>
# Contributor: Dan Fuhry <dan@fuhry.us>

pkgname=freeradius-kcrap
_pkgbase=freeradius
pkgver=2.1.12
pkgrel=3
pkgdesc="The premier open source RADIUS server - patched to support KCRAP authentication for MSCHAPv2 against MIT Kerberos"
arch=('i686' 'x86_64')
url="http://www.freeradius.org/"
license=("GPL")
provides=('freeradius')
depends=('openssl' 'krb5' 'pth' 'libldap>=2.4.18' 'net-snmp' 'pam'
	 'postgresql-libs>=9.0.3' 'libtool' 'libmysqlclient' 'gdbm' 'shadow'
	 'kcrap>=0.2.3-5')
optdepends=('libpcap' 'unixodbc' 'python2')
options=('!libtool' 'emptydirs' '!makeflags')
conflicts=('freeradius')
install=${_pkgbase}.install
source=(ftp://ftp.freeradius.org/pub/radius/freeradius-server-$pkgver.tar.bz2
	radiusd
	krb5-build-fix.patch
	freeradius-2.1.12-kcrap.patch)
md5sums=('862d3a2c11011e61890ba84fa636ed8c'
         'f1a6530b1b69d2fa793aa45b2de379bb'
         'c6a61de7576933f59154a53bfc12a2d2'
         'c8543ebbe4d74ba8dc4c21ef1724d0aa')
build() {
  cd $srcdir/freeradius-server-$pkgver
  export CFLAGS="$CFLAGS -fno-strict-aliasing"
  sed -i 's/ -DKRB5_DEPRECATED//' src/modules/rlm_krb5/Makefile.in
  patch -p1 <$srcdir/krb5-build-fix.patch
  patch -p1 <$srcdir/freeradius-2.1.12-kcrap.patch
  ./configure --with-system-libtool --with-system-libltdl \
	      --prefix=/usr --enable-heimdal-krb5 \
	      --localstatedir=/var \
	      --sysconfdir=/etc \
	      --libdir=/usr/lib/freeradius
  make
}

package() {
  cd $srcdir/freeradius-server-$pkgver
  make install R=$pkgdir
  install -D -m755 ../radiusd $pkgdir/etc/rc.d/radiusd
  chmod o+r $pkgdir/etc/raddb/*
  mv $pkgdir/etc/raddb $pkgdir/etc/raddb.default
  rm -rf $pkgdir/var/run
}
