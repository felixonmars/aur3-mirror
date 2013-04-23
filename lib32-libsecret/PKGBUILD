# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=libsecret
pkgname=lib32-${_pkgbase}
pkgver=0.15
pkgrel=1
pkgdesc='library for storing and retrieving passwords and other secrets. (32 bit)'
arch=('x86_64')
license=('LGPL')
url="https://live.gnome.org/Libsecret"
depends=('lib32-glib2' 'lib32-libgcrypt' "${_pkgbase}")
makedepends=('intltool' 'gcc-multilib' 'gobject-introspection' 'vala')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgbase}/${pkgver}/${_pkgbase}-${pkgver}.tar.xz)
sha256sums=('33e728b843efbe099483376ff5a3469260ee4b6ce035c7730909ac3793cb0fb8')

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd ${_pkgbase}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libdir=/usr/lib32 --disable-manpages
  make
}

package() {
  make -C ${_pkgbase}-${pkgver} DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
