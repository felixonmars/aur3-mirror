# Maintainer: Juan Pablo Sainea <jpsainea at gmail>

pkgname=bulmages
pkgver=0_13
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Aplicación modular para gestion pyme,BulmaCont,BulmaFact,BTPV"
url="http://bulmages.berlios.de/"
license=('GPL2')
depends=('postgresql' 'qt' 'pyqt' 'python-reportlab' 'python-psycopg2')
makedepends=('cmake' 'libpqxx')
source=("http://openpyme.osl.ull.es/attached/installers/1271/installers/${pkgname}_src_${pkgver}.tgz")
md5sums=('40f1d1f2fd45265fa4f2d3ca022fb633')
options=('!libtool' '!emptydirs')

build() {
  cd "$srcdir/$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_BUILD_TYPE=RELEASE .
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
