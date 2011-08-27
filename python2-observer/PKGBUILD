# Maintainer: Florian Léger <florian6 dot leger at laposte dot fr>

pkgname=python2-observer
pkgver=1.0.1
pkgrel=1
pkgdesc="Python library that provides a Java-like implementation of the Observer pattern."
arch=('any')
url='http://florian.leger2.free.fr/downloads/softwares/pyObserver/'
license=('GPL')
depends=('python2')
makedepends=('python2-distribute')
source=("http://florian.leger2.free.fr/downloads/softwares/pyObserver/pyObserver-${pkgver}.tar.bz2")
md5sums=('3f85abb4c1e08c704dca03285fb03424')

package() {
  cd "${srcdir}/pyObserver-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 || return 1
}

