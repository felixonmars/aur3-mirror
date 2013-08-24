pkgname=pasdoc
pkgver=0.13.0
pkgrel=1
pkgdesc="Pasdoc generates documentation for Pascal units."
url="http://pasdoc.sipsolutions.net"
license=("GPL")
arch=(i686 x86_64)
makedepends=(fpc)
source=("http://downloads.sourceforge.net/pasdoc/pasdoc-$pkgver-src.tar.gz")
md5sums=('2f53b3657b8b2b2e6d7bdea3e61801bb')

build() {
  cd "${srcdir}/pasdoc"
  make
}

package() {
  cd "${srcdir}/pasdoc"
  install -Dm755 "bin/pasdoc" "$pkgdir/usr/bin/pasdoc"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
