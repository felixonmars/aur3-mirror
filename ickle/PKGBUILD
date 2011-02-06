# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Nathan O <ndowens04 at gmail dot com>

pkgname=ickle
pkgver=0.3.2
pkgrel=3
pkgdesc="A icq2000 client using the gtk toolkit"
license=('gpl2')
arch=('i686' 'x86_64')
depends=('libicq2000>=0.3.2' 'gtkmm1')
source=(http://downloads.sourceforge.net/ickle/$pkgname-$pkgver.tar.gz)
url="http://ickle.sourceforge.net/"
md5sums=('c59acbc24ac90cfc7fd21c49038481ed')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make prefix=${pkgdir}/usr install
}
