# Contributor: John Tyree <johntyree@gmail.com>
pkgname=python2-rednose
pkgver=0.4.1
pkgrel=2
pkgdesc="A Nose plugin for for adding colour (and readability) to nosetest console results."
arch=('i686' 'x86_64')
url='http://pypi.python.org/pypi/rednose'
license=('MIT')
depends=('python2' 'python2-nose' 'python2-termstyle')
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/r/rednose/rednose-$pkgver.tar.gz")
md5sums=('8f5705c22a7f898ded65dd7b64c1f6de')

build() {
  cd ${srcdir}/rednose-$pkgver
  python2 setup.py build || return 1
  }

package() {
  cd ${srcdir}/rednose-$pkgver
  python2 setup.py install --root=${pkgdir} || return 1
}
