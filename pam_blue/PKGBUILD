# $Id: PKGBUILD,v 1.12 2003/11/06 08:26:13 dorphell Exp $
# Maintainer: Cyril LEVIS <atlas95@gmail.com>
# Contributor: Cyril LEVIS <atlas95@gmail.com>
pkgname=pam_blue
pkgver=0.1.0 
pkgrel=7
pkgdesc="an extention to PAM allowing authentication via a bluetooth compatible device."

arch=(i686 x86_64)
url="http://pam.0xdef.net"
license="GPL"
depends=('bluez-libs' 'bluez-utils')
install=('pam_blue.install')
source=(http://pam.0xdef.net/source/$pkgname-$pkgver.tar.bz2) 
md5sums=('f81841979eb35e52df950583ca75cc6c')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --libdir=/lib/security --sysconfdir=/etc
  make || return 1
  make prefix=$startdir/pkg/usr install

}
