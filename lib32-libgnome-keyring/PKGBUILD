#Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=libgnome-keyring
pkgname=lib32-${_pkgbase}
pkgver=3.10.1
pkgrel=1
pkgdesc="GNOME keyring client library (32 bit)"
arch=('x86_64')
url="http://www.gnome.org"
license=('GPLv2' 'LGPLv2')
depends=('lib32-glib2' 'lib32-libgcrypt' "${_pkgbase}") # 'lib32-dbus-core'
makedepends=('intltool' 'gcc-multilib' 'gobject-introspection')
options=('!emptydirs')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgbase}/3.10/${_pkgbase}-${pkgver}.tar.xz)
sha256sums=('052cf1121ba823359afe534c425f7e216c6a2b1a2b316dee279dcf9032423772')

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd ${_pkgbase}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib32/gnome-keyring \
      --libdir=/usr/lib32
  make
}

package() {
  cd ${_pkgbase}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share}
}
