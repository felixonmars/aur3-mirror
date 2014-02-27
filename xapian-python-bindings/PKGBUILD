# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=xapian-python-bindings
_realname=xapian-bindings
pkgver=1.2.17
pkgrel=1
pkgdesc="Python bindings for Xapian"
arch=(i686 x86_64)
url="http://xapian.org/docs/bindings/python/"
license=('GPL')
groups=(xapian)
depends=('python' 'xapian-core')
makedepends=('gcc')
source=(http://oligarchy.co.uk/xapian/${pkgver}/${_realname}-$pkgver.tar.xz)
md5sums=('9a31d998196e51551d38f386cf1544e1')
sha256sums=('54ad5d818fa7d6558acbf517a04c78db9fb4c90103eda0a0f9fe9a864683f80a')

build() {
  cd "$srcdir/${_realname}-$pkgver"
  ./configure XAPIAN_CONFIG=/usr/bin/xapian-config --prefix=/usr --with-python
  make
}

package() {
  cd "$srcdir/${_realname}-$pkgver"
  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
