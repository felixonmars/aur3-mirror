# Maintainer: Felix Yan <felixonmars@gmail.com>
pkgname=match-vamp-plugin
pkgver=0.2.1
_downloadid=522
pkgrel=1
pkgdesc="Vamp implementation of the MATCH audio alignment algorithm from Simon Dixon"
arch=("i686" "x86_64")
url="https://code.soundsoftware.ac.uk/projects/match-vamp"
license=("GPL2")
depends=("vamp-plugin-sdk")
source=("https://code.soundsoftware.ac.uk/attachments/download/$_downloadid/$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 match-vamp-plugin.so "$pkgdir/usr/lib/vamp/match-vamp-plugin.so"
}

# vim:set ts=2 sw=2 et:
md5sums=('a1ba304c26a9de143d1d00f157e2dd51')
