# Maintainer: Jim Turner <jturner314 @t gmail dot com>

pkgname=python-pint-git
pkgver=0.4.2.r1.gcfe1c9a
pkgrel=1
pkgdesc="A package to define and manipulate physical quantities (numbers with units)"
url="http://pint.readthedocs.org/"
license=("BSD")
arch=('any')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname::git+https://github.com/hgrecco/pint.git")
provides=('python-pint')
conflicts=('python-pint')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir"
  install -D -m0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
