# Maintainer: josephgbr <rafael.f.f1 at gmail dot com>

_pkgbasename=eggdbus
pkgname=lib32-$_pkgbasename
pkgver=0.6
pkgrel=8
pkgdesc="GObject bindings for D-Bus (32 bit)"
arch=('x86_64')
url="http://cgit.freedesktop.org/~david/eggdbus"
license=('LGPL')
depends=('lib32-dbus-glib' 'lib32-glibc')
makedepends=('gcc-multilib') # 'gtk-doc'
options=('!libtool')
source=("http://cgit.freedesktop.org/~david/${_pkgbasename}/snapshot/${_pkgbasename}-${pkgver}.tar.bz2")
md5sums=('0a111faa54dfba2cf432c2c8e8a76e06')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  
  ./autogen.sh --prefix=/usr --libdir=/usr/lib32 --enable-gtk-doc=no \
  			--libexecdir=/usr/lib32/$_pkgbasename CC='gcc -m32'
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  
  make DESTDIR="${pkgdir}" install
  rm -rf ${pkgdir}/usr/{bin,include,share}
}
