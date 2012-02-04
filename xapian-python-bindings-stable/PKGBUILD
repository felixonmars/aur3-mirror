# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=xapian-python-bindings-stable
_realname=xapian-bindings
pkgver=1.2.6
pkgrel=1
pkgdesc="Python bindings for Xapian"
arch=(i686 x86_64)
url="http://xapian.org/docs/bindings/python/"
license=('GPL')
groups=(xapian)
depends=('python' 'xapian-core')
makedepends=('gcc')
source=(http://oligarchy.co.uk/xapian/${pkgver}/${_realname}-$pkgver.tar.gz)
md5sums=('a323fc86444dd23cc5db23e96e5b0116')

build() {
  cd "$srcdir/${_realname}-$pkgver"
  PYTHON=/usr/bin/python2 ./configure XAPIAN_CONFIG=/usr/bin/xapian-config --prefix=/usr --with-python
  make
}

package() {
  cd "$srcdir/${_realname}-$pkgver"
  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
