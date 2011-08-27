# Maintainer: kiefer <jorgelmadrid@gmail.com>

pkgname=eggdbus
pkgver=0.6
pkgrel=6
pkgdesc="GObject bindings for D-Bus"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/~david/eggdbus"
license=('GPL')
depends=('dbus' 'dbus-glib' 'glibc')
makedepends=('gtk-doc')
source=("http://cgit.freedesktop.org/~david/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.bz2")
md5sums=('0a111faa54dfba2cf432c2c8e8a76e06')

build() {

  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}