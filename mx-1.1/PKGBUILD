# Maintainer: Jonathan Lestrelin <zanko@daemontux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Guenther Wutz <admin@wutzara.de>

pkgname=mx-1.1
_pkgname=mx
pkgver=1.1.12
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
source=("http://source.clutter-project.org/sources/$_pkgname/1.1/$_pkgname-$pkgver.tar.bz2")
sha256sums=('6208505e3ef6fb7b770c5044aa9197310c33990647ca84407785758e873a71f4')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
