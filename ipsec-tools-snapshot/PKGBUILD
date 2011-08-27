# $Id: PKGBUILD 3561 2009-10-05 20:16:00Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Allan Henriksen <allan.henriksen@gmail.com>

pkgname=ipsec-tools-snapshot
pkgver=0.8alpha20090903
_pkgname=ipsec-tools
_pkgver=0.8-alpha20090903
pkgrel=1
pkgdesc="KAME IPSec tools ported to Linux"
arch=('i686' 'x86_64')
url="http://ipsec-tools.sourceforge.net/"
depends=('readline' 'openssl')
license=('GPL')
options=('!makeflags' '!libtool')
conflicts=('ipsec-tools')
provides=('ipsec-tools')
replaces=('ipsec-tools')
source=(http://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-$_pkgver.tar.bz2
	racoon.rc)
md5sums=('701f7ce0d680b6aa17937e8265c060e2'
         'a9d89177f0eecd1df4fbe21c201ee046')

build() {
  cd $srcdir/$_pkgname-$_pkgver

  sed -i 's#-Werror##' configure

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	--enable-security-context=no --enable-hybrid --enable-dpd \
	--enable-natt --enable-adminport

  make || return 1
  make DESTDIR=$pkgdir install || return 1

  install -Dm0755 $srcdir/racoon.rc $pkgdir/etc/rc.d/racoon
}
