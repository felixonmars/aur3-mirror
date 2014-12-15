# Maintainer: Kniyl <mathias.ettinger@gmail.com>

pkgname=python2-cartridge
pkgver=0.9.5
pkgrel=1
pkgdesc="A Django shopping cart application."
arch=('any')
license=('BSD')
url="http://cartridge.jupo.org/"
depends=('python2' 'python2-mezzanine>=3.1' 'python2-xhtml2pdf')
makedepends=('python2-distribute')
source=("http://pypi.python.org/packages/source/C/Cartridge/Cartridge-${pkgver}.tar.gz")
md5sums=('d9b26e7a33e1dbafbee3f99b42f1d408')
sha256sums=('26c4fd37e0dd2be8ec233f1a98c57330101f5836451b5cb17818f415119611dc')

build() {
  cd "${srcdir}/Cartridge-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/Cartridge-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}
