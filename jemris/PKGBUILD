pkgname=jemris
pkgver=2.7.2
pkgrel=1
pkgdesc="A high performace computing open source simulator for MRI"
arch=('any')
url="http://www.jemris.org/"
depends=('openmpi' 'ginac' 'xerces-c' 'cvode' 'hdf5-openmpi')
makedepends=('boost' 'cln' )
optdepends=()
license=('GPL')
source=(http://www.jemris.org/get/${pkgname}-${pkgver}-src.tar.gz)
sha1sums=('1c33398397af6e26ce544a22fdf2437eb7b863c2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-src"
  ./configure --prefix=/usr
  make
  
}

package() {
  cd ${srcdir}/$pkgname-$pkgver-src

  make DESTDIR="${pkgdir}" install
}
