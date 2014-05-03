# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>

pkgname=python-podcastparser
_pkgname=podcastparser
pkgver=0.4.0
pkgrel=1
pkgdesc='Simple, fast and efficient podcast parser written in Python'
arch=('any')
url='http://gpodder.org/podcastparser/'
license=('ISC')
groups=('gpodder')
depends=('python')
source=("http://gpodder.org/podcastparser/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('b7fadc28ad098ac022ad5dbc01500f6a20834450f67c6c38209cc7c72e4edfe89d81e81e559dd1a051f27176cf848ff51036920361119eb2227a211edab4c8b3')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.ISC"
}
