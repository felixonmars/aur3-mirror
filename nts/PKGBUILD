# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Bjorn Michelsen <bjorn@bmichelsen.no>

pkgname=nts
pkgver=82
pkgrel=1
pkgdesc="Simple notes manager written in Python"
arch=('any')
url="http://www.duke.edu/~dgraham/NTS/"
license=('GPL3')
depends=('python2' 'python2-dateutil' 'wxpython')
makedepends=('python2-setuptools')
optdepends=('docutils: for displaying/printing notes as HTML')
source=("http://www.duke.edu/~dgraham/NTS/${pkgname}-${pkgver}.tar.gz")
md5sums=('0d0da351859ae9131b676720f4a831ea')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --prefix=/usr || return 1
}
