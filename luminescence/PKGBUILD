pkgname=luminescence
pkgver=1.3
pkgrel=1
pkgdesc="A plugin-based minimalistic web browser"

url="http://mg0.fr/luminescence"
license=('BSD3')

arch=('i686' 'x86_64')
depends=('gtk3' 'libwebkit3')
makedepends=('gcc' 'pkg-config')

source=(http://mg0.fr/pub/lumi/${pkgname}-${pkgver}.tar.gz)
md5sums=('ed528b0375c9fc8bca175d3269c7fa24')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir/usr" install
}
