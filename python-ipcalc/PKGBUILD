# Contributor: ugaciaka <ugaciaka@gmail.com>
# Contributor: Nikolaus Brandt <sua-aur-661bbb3b@brandt-n.eu>
pkgname=python-ipcalc
pkgver=1.1.1
pkgrel=1
pkgdesc='IP subnet calculator for Python'
arch=('any')
url='https://github.com/tehmaze/ipcalc/issues'
license=('unknown')
depends=('python2')
source=("http://pypi.python.org/packages/source/i/ipcalc/ipcalc-1.1.1.tar.gz")
md5sums=('a5f724278b0181f210dcea3dc7053635')

package() {
  cd ${srcdir}/${pkgname/python-/}-${pkgver}
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
