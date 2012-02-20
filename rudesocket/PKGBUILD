# $Id: PKGBUILD,v 1.9 2006/05/20 22:35:02 uid1016 Exp $
# Contributor: Alexis211 <alexis211@gmail.com>
# Maintainer: Fat Cat <carlos dot manuel250 at gmail dot com>

pkgname=rudesocket
pkgver=1.2.0
pkgrel=2
pkgdesc="An Open Source C++ socket library"
url="http://rudeserver.com/socket"
arch=('i686' 'x86_64')
license=('GPL')
depends=('openssl')
makedepends=('gcc')
options=('!libtool' 'strip' '!emptydirs' 'zipman')
source=(http://rudeserver.com/socket/download/$pkgname-$pkgver.tar.gz)
md5sums=('f3bef7baff32e769db823c1027807124')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --libexecdir=/usr/lib/$pkgname \
              --sysconfdir=/etc --localstatedir=/var \
              --infodir=/usr/share/info --mandir=/usr/share/man \
              --with-openssl
  make 
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
