# Maintainer: Your Name <youremail@domain.com>
pkgname=torrent2json
pkgver=0.03
pkgrel=1
pkgdesc="Set of programs to convert torrent files to json and back."
arch=('i686')
url="https://github.com/AdUser/torrent2json"
license=('GPL2')
depends=('yajl')
makedepends=('cmake')
source=("https://github.com/downloads/AdUser/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('aacfeaebbf6fb763ba9c205d33316170')

build() {
  cd "$srcdir/$pkgname"
  cmake -DCMAKE_BUILD_TYPE="Release" .
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
