# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=libunique3
pkgname=lib32-${_pkgbase}
pkgver=3.0.2
pkgrel=2
pkgdesc="Library for writing single instance applications for GTK3 (32 bit)"
arch=('x86_64')
license=('LGPL')
url="http://live.gnome.org/LibUnique"
depends=('lib32-gtk3' "${_pkgbase}")
makedepends=('gobject-introspection' 'gcc-multilib') # gtk-doc
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/libunique/3.0/libunique-${pkgver}.tar.xz)
sha256sums=('a8f02ce073e2b920cca8ac45d418e7cb64438ad0814780c5912c6d63f8a4e038')

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd libunique-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --disable-dbus --libdir=/usr/lib32
  make
}

package() {
  make -C libunique-${pkgver} DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share}
}
