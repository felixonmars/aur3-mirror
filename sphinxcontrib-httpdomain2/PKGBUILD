# Maintainer: Marcel Wysocki <maci@satgnu.net>

pkgname=sphinxcontrib-httpdomain2
pkgver=1.2.0
pkgrel=1
pkgdesc="HTTP domain extension for sphinx"
arch=(any)
url="https://bitbucket.org/birkenfeld/sphinx-contrib/"
license=('BSD')
depends=('python-sphinx')
makedepends=()
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/s/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('cc5ea9cbb3989d8dd370c1bb5a6bce7ef67ed421')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
