# Maintaner: Giorgio Gilestro <giorgio@gilest.ro>
pkgname=epox-presenter
pkgver=0.4.1
pkgrel=1
pkgdesc="Bluetooth connection stack for epox presenters"
arch=('i686' 'x86_64')
url="http://mulliner.org/bluetooth/"
license="GPL"
makedepends=()
depends=()
source=(http://dl.dropbox.com/u/52420/AUR/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('7d146dbcf4275e1ba925b7c324a6befc')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./configure
  make
}

package() {
  mkdir -p $pkgdir/usr/bin
  install $srcdir/${pkgname}-${pkgver}/src/epox-presenter $pkgdir/usr/bin/	
}
