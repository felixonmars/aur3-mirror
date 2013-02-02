pkgname=nethub
pkgver=1.1
pkgrel=1
pkgdesc="network repeater"

url="https://github.com/fmang/nethub"
license=('BSD3')

arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('gcc' 'make')

source=(http://mg0.fr/pub/c/${pkgname}-${pkgver}.tar.gz)
sha1sums=('52a918f78c5b70d665ff56333dbb5fec4f5204c1')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir/usr" install
}
