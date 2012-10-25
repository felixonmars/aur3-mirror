# Maintainer: josephgbr <rafael.f.f1@gmail.com>
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbase=dbus-glib
pkgname=libx32-$_pkgbase
pkgver=0.100
pkgrel=1.1
pkgdesc="GLib bindings for DBUS (x32 ABI)"
arch=('x86_64')
license=('GPL')
url="http://www.freedesktop.org/wiki/Software/DBusBindings"
depends=('libx32-dbus-core' 'libx32-glib2' "${_pkgbase}=${pkgver}")
makedepends=('gcc-multilib-x32')
options=('!libtool' '!emptydirs')
source=(http://dbus.freedesktop.org/releases/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz)
md5sums=('d33959a9c0c6a158f5ac6d640316e89e')

build() {
  export CC='gcc -mx32'
  export CXX='g++ -mx32'
  
  cd ${_pkgbase}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	--enable-static=no --enable-bash-completion=no \
	--libdir=/usr/libx32
  make
}

package() {
  cd ${_pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr"/{bin,include,share}
}
