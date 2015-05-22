# Maintainer: Peter Shinners <pete@shinners.org>

pkgname=python2-ilmbase
pkgver=2.2.0
pkgrel=2
depends=('ilmbase' 'boost' 'python2-numpy')
pkgdesc="Python bindings for the ILM OpenEXR base libraries"
arch=('i686' 'x86_64')
url="http://www.openexr.com"
license=('custom')
source=(http://download.savannah.nongnu.org/releases/openexr/pyilmbase-$pkgver.tar.gz)
options=('!libtool')

# Parallel make kills the build and package steps, force to single

build() {
  cd "${srcdir}/pyilmbase-$pkgver"
  PYTHON=/usr/bin/python2.7 ./configure --prefix=/usr
  make -j1
}

package() {
  cd "${srcdir}/pyilmbase-$pkgver"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  make -j1 DESTDIR="${pkgdir}/" install
}
md5sums=('e84a6a4462f90b5e14d83d67253d8e5a')

