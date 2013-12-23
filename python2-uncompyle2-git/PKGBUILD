pkgname=python2-uncompyle2-git
pkgver=20131201
pkgrel=1
pkgdesc="A Python 2.5, 2.6, 2.7 byte-code decompiler, written in Python 2.7"
url="https://github.com/Mysterie/uncompyle2"
arch=('any')
depends=('python2')
makedepends=('git')
conflicts=('python2-uncompyle')
license=('GPL3')
source=('git+https://github.com/Mysterie/uncompyle2.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/uncompyle2"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/uncompyle2"
  python2 setup.py build
}

package() {
  cd "$srcdir/uncompyle2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}