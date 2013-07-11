# Maintainer: Wei-Ning Huang <aitjcize@gmail.com>
pkgname=qwertickle
pkgver=0.1.4
pkgrel=3
pkgdesc="A typewriter sound scheme for your keyboard"
arch=('any')
url="https://github.com/Aitjcize/qwertickle"
license=('GPLv3')
depends=(gtk2 gstreamer0.10 gstreamer0.10-base-plugins gstreamer0.10-ugly-plugins libxtst)
source=(https://github.com/downloads/Aitjcize/qwertickle/${pkgname}-${pkgver}.tar.gz)
md5sums=('170bf94d68ca7dcc2eb061fd327a3205')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
