# Maintainer: "Ender Fletcher" <e2fletcher@gmail.com>

pkgname=gtablas
pkgver=1.r12.36d3ca5
pkgrel=1
pkgdesc="Generador de Tablas Magicas"
arch=(i686)
url='https://github.com/e2fletcher/TablasMagIc'
license=('LGPL')
makedepends=('git' 'cmake>=2.8')
source=("$pkgname"::'git+https://github.com/e2fletcher/TablasMagIc.git')
#source=("https://github.com/e2fletcher/TablasMagIc")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  # Use the tag of the last commit
  printf "1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR=${pkgdir} install
}
