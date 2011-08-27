# Maintainer: Rob Dailey <rob at virtualaddiction dot net>
pkgname=docsis
pkgver=0.9.6
pkgrel=1
pkgdesc="DOCSIS Configuration File creator"
license=('GPL')
arch=('i686' 'x86_64')
url="http://docsis.sourceforge.net/"
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('fd431046f04b10fe8e46c4dd1c178b58')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install || return 1
}
