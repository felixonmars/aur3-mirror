# Contributor: Berseker <berseker86 at gmail dot com>

pkgname=librest
_realname=rest

pkgver=0.7.9
pkgrel=1
pkgdesc="a library to access 'RESTful' web services"
arch=('i686' 'x86_64')
url="http://moblin.org/projects/librest/"
license=('GPL')
source=(http://ftp.gnome.org/pub/GNOME/sources/rest/0.7/${_realname}-${pkgver}.tar.bz2)
options=('!libtool')
depends=('libsoup' 'libxml2')
makedepends=('gtk-doc')

build() {
  cd "$srcdir/${_realname}-${pkgver}"

  ./configure  --prefix=/usr --without-gnome
  make || return 1
  make DESTDIR="$pkgdir/" install
}
sha256sums=('e3f8b204b872598009a68b71e3bef0c5ba5318e6822b98064ecff797142f9104')
