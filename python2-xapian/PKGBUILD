# Contributor: DonVla <donvla/users.sourceforge/net>
# Maintainer: Hervé Cauwelier <herve/oursours/net>

pkgname=python2-xapian
_realname=xapian-bindings
pkgver=1.2.10
pkgrel=1
pkgdesc="Python bindings for Xapian"
arch=(i686 x86_64)
url="http://xapian.org/docs/bindings/python/"
license=('GPL')
groups=(xapian)
depends=('python2' 'xapian-core')
makedepends=('gcc')
conflicts=('xapian-python-bindings')
source=(http://oligarchy.co.uk/xapian/${pkgver}/${_realname}-$pkgver.tar.gz)

build() {
  cd "$srcdir/${_realname}-$pkgver"
    
  ./configure XAPIAN_CONFIG=/usr/bin/xapian-config \
         --prefix=/usr --with-python \
         PYTHON=/usr/bin/python2

  make
}


package() {
  cd "$srcdir/${_realname}-$pkgver"

  make DESTDIR="$pkgdir" install
}
# vim:set ts=2 sw=2 et:
md5sums=('f334cf7d1c9606669d15afd1a171b169')
