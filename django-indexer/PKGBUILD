# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=django-indexer
pkgver=0.3.0
pkgrel=1
pkgdesc="A key/value indexer"
arch=('any')
url="http://pypi.python.org/pypi/$pkgname"
license=('custom')
depends=('python2' 'django')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/d/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('3e10959319901d5f27d356bdd377b0cb')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:
