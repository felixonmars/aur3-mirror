# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-traits
pkgver=4.2.0
_githubtag=0afc79d
pkgrel=1
pkgdesc="Explicitly typed attributes for Python"
arch=('i686' 'x86_64')
url="https://github.com/enthought/traits"
license=('BSD')
depends=('python2-numpy')
makedepends=('python2-distribute')
conflicts=('python-enthought-traits' 'python2-traits-git' 'python-ets-traits-svn')
options=(!emptydirs)

source=("https://github.com/enthought/traits/tarball/${pkgver}")
md5sums=('835c83c320ed1109ca05fa4ae4556828')

build() {
  cd "$srcdir/enthought-traits-${_githubtag}"

  python2 setup.py build
}

package() {
  cd "$srcdir/enthought-traits-${_githubtag}"

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

