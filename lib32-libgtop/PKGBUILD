# Maintainer: josephgbr <rafael.f.f1@gmail.com>
# Contributor: TryA <tryagainprod {at} gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbase=libgtop
pkgname=lib32-${_pkgbase}
pkgver=2.28.5
pkgrel=1
pkgdesc="A library that read information about processes and the running system (32-bit)"
arch=('x86_64')
license=('LGPL')
depends=('lib32-glib2' 'lib32-libxau' "${_pkgbase}")
makedepends=('intltool' 'gcc-multilib' 'texinfo' 'gobject-introspection')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgbase}/2.28/${_pkgbase}-${pkgver}.tar.xz)
options=('!libtool')
url="http://www.gnome.org/"
sha256sums=('c812c174e44a8971a1f33265437cfd10f1e99869c7f5c05f8ee95846a70a3342')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${_pkgbase}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --with-libgtop-smp --libdir=/usr/lib32
  make
}

package() {
  make -C ${_pkgbase}-${pkgver} DESTDIR="${pkgdir}" install
  rm -rf ${pkgdir}/usr/{include,share}
}
