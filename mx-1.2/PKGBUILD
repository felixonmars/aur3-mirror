# Maintainer: Jonathan Lestrelin <zanko@daemontux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Guenther Wutz <admin@wutzara.de>

pkgname=mx-1.2
_pkgname=mx
pkgver=1.2.0
pkgrel=1
pkgdesc="A widget toolkit using Clutter"
arch=('i686' 'x86_64')
url="http://www.clutter-project.org"
license=('LGPL')
provides=('mx')
conflicts=('mx')
depends=('clutter' 'libxrandr' 'dbus-glib' 'gtk2' 'startup-notification')
makedepends=('intltool' 'gobject-introspection')
options=('!libtool')
source=("http://source.clutter-project.org/sources/$_pkgname/1.2/$_pkgname-$pkgver.tar.bz2")
sha256sums=('9d1e6d4fa2cc7254c319c4e9bc892a9da88e54287494953d31354e559bac6d8a')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
