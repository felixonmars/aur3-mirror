# Contributor: ugaciaka <ugaciaka@gmail.com>
# Contributor: Nikolaus Brandt <sua-aur-661bbb3b at brandt-n dot eu>
pkgname=python2-ipcalc
pkgver=1.1.3
pkgrel=1
pkgdesc='IP subnet calculator for Python'
arch=('any')
url='https://github.com/tehmaze/ipcalc'
license=('BSD')
depends=('python2')
source=("http://pypi.python.org/packages/source/i/ipcalc/ipcalc-1.1.3.tar.gz")
md5sums=('14aa5f92d316631df6c4557a0e87c61b')

package() {
  cd ${srcdir}/${pkgname/python2-/}-${pkgver}
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
