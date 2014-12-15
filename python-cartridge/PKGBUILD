# Maintainer: Kniyl <mathias.ettinger@gmail.com>

pkgname=python-cartridge
pkgver=0.9.5
pkgrel=1
pkgdesc="A Django shopping cart application."
arch=('any')
license=('BSD')
url="http://cartridge.jupo.org/"
depends=('python' 'python-mezzanine>=3.1')
makedepends=('python-distribute')
source=("http://pypi.python.org/packages/source/C/Cartridge/Cartridge-${pkgver}.tar.gz"
        "python-cartridge.install")
install='python-cartridge.install'
md5sums=('d9b26e7a33e1dbafbee3f99b42f1d408'
         '03ff9b9626f91b0c2f4fb4b592871a51')
sha256sums=('26c4fd37e0dd2be8ec233f1a98c57330101f5836451b5cb17818f415119611dc'
            '7a7165cbc9433321d210f88fb5daeaf81d5b6f9d440e48e38524fcc4040e522d')

build() {
  cd "${srcdir}/Cartridge-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/Cartridge-${pkgver}"
  python setup.py install --root="${pkgdir}"
}
