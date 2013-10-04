# Maintainer: Nils Werner <nils.werner@gmail.com>
pkgname=python2-spectrum
pkgver=0.4.3
pkgrel=1
pkgdesc="Spectrum is a python package dedicated to Digital Spectral Analysis."
url="https://www.assembla.com/spaces/PySpectrum"	
arch=('any')
license=('LGPL')
depends=('python2' 'python2-distribute')
optdepends=()
makedepends=()
conflicts=()
replaces=('python-spectrum')
backup=()
install=
source=("https://www.assembla.com/spaces/PySpectrum/documents/bm5C-k_OGr4jWEacwqjQWU/download/bm5C-k_OGr4jWEacwqjQWU")
md5sums=('8da33cf4a0f01f04388a9b819b714ebd')
 
build() {
  cd "${srcdir}/spectrum-$pkgver"
  python2 setup.py build
}
 
package() {
  cd "${srcdir}/spectrum-$pkgver"
  python2 setup.py install --root="${pkgdir}"
}
