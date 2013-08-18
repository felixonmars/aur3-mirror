# Maintainer kleskjr <kleskjr@gmail.com>
# Contributer Dennis Hamester <dennis.hamester [AT] gmail [DOT] com>
pkgname=python2-brian
pkgver=1.4.1
pkgrel=1
pkgdesc="A Python simulator for spiking neural networks."
url="http://www.briansimulator.org/"
license=('custom:CeCILL-V2')
arch=('i686' 'x86_64')
depends=('python2-numpy>=1.4.1', 'python2-scipy>=0.7.0', 'python2-matplotlib>=0.90.1')
optdepends=('python2-sympy')
source=("http://pypi.python.org/packages/source/b/brian/brian-${pkgver}.zip"
        "http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt")
md5sums=('accd91088e4119001183a8dd3c8dffee'
         '2d740db2d9a00ce8e4d54d3ea8789b5a')

build() {
  cd ${srcdir}/brian-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/brian-${pkgver}
  python2 setup.py install --root=${pkgdir} --optimize=1
  install -Dm644 ../Licence_CeCILL_V2-en.txt ${pkgdir}/usr/share/licenses/${pkgname}/CeCILL-V2
}
