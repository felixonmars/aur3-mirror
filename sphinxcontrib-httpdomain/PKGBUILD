# Maintainer: Alexandre Bique <bique.alexandre@gmail.com>

pkgname=sphinxcontrib-httpdomain
pkgver=1.1.7
pkgrel=1
pkgdesc="HTTP domain extension for sphinx"
arch=(any)
url="https://bitbucket.org/birkenfeld/sphinx-contrib/"
license=('BSD')
depends=('python-sphinx')
makedepends=()
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/s/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('12704b125541580477b6b4df6780fbe7')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
