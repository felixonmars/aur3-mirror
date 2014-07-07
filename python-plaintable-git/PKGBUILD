# Maintainer: Stefan Tatschner <stefan@sevenbyte.org>

pkgname=('python-plaintable-git' 'python2-plaintable-git' 'pypy-plaintable-git'
         'pypy3-plaintable-git')
_pkgname=plaintable
pkgver=v0.1.r0.g7389cde
pkgrel=1
pkgdesc="A simple library to build plain text tables"
arch=('any')
url="https://github.com/rumpelsepp/plaintable"
license=('MIT')
source=("${_pkgname}::git+https://github.com/rumpelsepp/plaintable.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
  # printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_python-plaintable-git() {
  provides=('python-plaintable')
  conflicts=('python-plaintable')
  depends=('python')
  makedepends=('python-setuptools')

  cd "$srcdir/${_pkgname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

package_python2-plaintable-git() {
  provides=('python2-plaintable')
  conflicts=('python2-plaintable')
  depends=('python2')
  makedepends=('python2-setuptools')

  cd "$srcdir/${_pkgname}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

package_pypy-plaintable-git() {
  provides=('pypy-plaintable')
  conflicts=('pypy-plaintable')
  depends=('pypy')
  makedepends=('pypy-setuptools')

  cd "$srcdir/${_pkgname}"
  pypy setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

package_pypy3-plaintable-git() {
  provides=('pypy3-plaintable')
  conflicts=('pypy3-plaintable')
  depends=('pypy3')
  makedepends=('pypy3-setuptools')

  cd "$srcdir/${_pkgname}"
  pypy3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
