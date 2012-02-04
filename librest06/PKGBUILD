# Contributor: Berseker <berseker86 at gmail dot com>

pkgname=librest06
_realname=librest

pkgver=0.6.1
pkgrel=1
pkgdesc="a library to access 'RESTful' web services (legacy version)"
arch=('i686' 'x86_64')
url="http://moblin.org/projects/librest/"
license=('GPL')
source=("http://ftp.de.debian.org/debian/pool/main/libr/librest/${_realname}_${pkgver}.orig.tar.gz")
options=('!libtool')
depends=('libsoup' 'libxml2')
makedepends=('gtk-doc')
md5sums=('4cd7bb394027ae36b67fdf874898b9fa')
build() {
  cd "$srcdir/${_realname}-${pkgver}"
  ./autogen.sh
  ./configure  --prefix=/usr --without-gnome
  make || return 1
  make DESTDIR="$pkgdir/" install
}
