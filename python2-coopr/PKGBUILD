# Contributor: Alex Peltzer <alex.peltzer@gmail.com>
# Maintainer: Alex Peltzer <alex.peltzer@gmail.com>

pkgname=python2-coopr
pkgver=4.0.9597
pkgrel=1
pkgdesc="Coopr: a COmmon Optimization Python Repository"
arch=('x86_64')
url="https://pypi.python.org/pypi/Coopr/4.0.9597"
license=('BSD')
depends=('python2')
source=("https://pypi.python.org/packages/source/C/Coopr/Coopr-4.0.9597.tar.gz")
md5sums=('b25927f0067c71659e1e59d5163a19a3')

package() {
  cd "${srcdir}/Coopr-${pkgver}/"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}



