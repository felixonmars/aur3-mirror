# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=xapian-python-bindings-svn
pkgver=r11745
pkgrel=2
pkgdesc="Python bindings for Xapian"
arch=(i686 x86_64)
url="http://xapian.org/"
license=('GPL')
groups=(xapian)
depends=('python' 'xapian-core')
conflicts=('xapian-python-bindings')
provides=('xapian-python-bindings')
makedepends=('gcc')
source=(http://xappy.googlecode.com/files/xapian-bindings-11745.tgz)
md5sums=('ad696a57f225220eab7f075122b6d402')

build() {
  cd "$srcdir/xapian-bindings"
  ./configure XAPIAN_CONFIG=/usr/bin/xapian-config \
         --prefix=/usr --with-python 
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
# vim:set ts=2 sw=2 et:
