# Maintainer: Ismo Toijala <ismo.toijala@gmail.com>
pkgname=python2-root_numpy
pkgver=3.0.2
pkgrel=1
pkgdesc="An interface between ROOT and NumPy"
arch=('i686' 'x86_64')
url="http://rootpy.github.io/root_numpy/"
license=('MIT')
depends=('python2' 'root' 'python2-numpy')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/r/root_numpy/root_numpy-${pkgver}.tar.gz")
md5sums=('c801529b6aa8ac8586e2ea63fbdc990e')

package() {
  cd "${srcdir}/root_numpy-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
