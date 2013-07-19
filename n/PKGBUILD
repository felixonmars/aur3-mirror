# Maintainer: Eivind Uggedal <eivind@uggedal.com>
pkgname=n
pkgrel=1
pkgver=1.1.0.2.gbf0b532
pkgdesc="Simple flavour of node binary management"
arch=('any')
url="http://github.com/visionmedia/n"
license=('MIT')
makedepends=('git')
source=(git+https://github.com/visionmedia/n.git)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir"/n
  local ver="$(git describe)"
  ver="${ver#v}"
  echo "${ver//-/.}"
}

package() {
  cd "$srcdir"/n

  install -d "$pkgdir/usr/bin"
  make install PREFIX="$pkgdir/usr"
}
