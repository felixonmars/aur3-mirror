# Maintainer: 
pkgname=libframe
pkgver=8.20
pkgrel=0
pkgdesc="Library for manipulating the 'Common Data Frame Format for Interferometric Gravitational Wave Detector'."
url="http://lappweb.in2p3.fr/virgo/FrameL/"
arch=('any')
license=('custom')
groups=('lscsoft')

source=("http://lappweb.in2p3.fr/virgo/FrameL/${pkgname}-${pkgver}.tar.gz")
md5sums=('4e95fe3af932b68b4ab1bcd892656dfc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et: