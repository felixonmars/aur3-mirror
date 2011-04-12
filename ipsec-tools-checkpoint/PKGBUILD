# Maintainer: Andrew de Quincey <adq@lidskialf.net>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Allan Henriksen <allan.henriksen@gmail.com>

pkgname=ipsec-tools-checkpoint
pkgver=0.8.0
pkgrel=1
pkgdesc="KAME IPSec tools ported to Linux with support for Checkpoint VPN-1 Proprietary XAUTH authentication"
arch=('i686' 'x86_64')
url="http://ipsec-tools.sourceforge.net/"
depends=('readline' 'openssl')
license=('GPL')
options=('!makeflags' '!libtool')
source=(http://downloads.sourceforge.net/sourceforge/ipsec-tools/ipsec-tools-$pkgver.tar.bz2
	racoon.rc
	ipsec.rc
	ipsec-tools-0.8.0-checkpoint-v1.patch)
md5sums=('b79aae3055a51f8de5c0f1b8ca6cf619'
         'a9d89177f0eecd1df4fbe21c201ee046'
         '90d0810267cbd847383ae3101699b192'
	 '8a3b6cc5483cdb6ec3f1b58095c95127')

build() {
  cd $srcdir/ipsec-tools-$pkgver
  patch -p1 < $startdir/ipsec-tools-0.8.0-checkpoint-v1.patch
  sed -i 's#-Werror##' configure
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	--enable-security-context=no --enable-hybrid --enable-dpd --enable-natt \
	--enable-adminport
  make
  make DESTDIR=$pkgdir install
  install -Dm0755 $srcdir/racoon.rc $pkgdir/etc/rc.d/racoon
  install -Dm0755 $srcdir/ipsec.rc $pkgdir/etc/rc.d/ipsec
}
