# Maintainer: Oliver Gasser <oliver@flowriver.net>
pkgname=python-ipfix-git
pkgver=v0.9.4.r61.g4da3903
pkgrel=1
pkgdesc="IPFIX implementation for Python 3.x"
arch=('any')
url="https://github.com/britram/python-ipfix"
license=('LGPL3')
depends=('python')
provides=('python-ipfix')
conflicts=('python-ipfix')
options=(!emptydirs)
source=('git+https://github.com/britram/python-ipfix')
md5sums=('SKIP')
_gitname=python-ipfix

pkgver() {
  cd "$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
