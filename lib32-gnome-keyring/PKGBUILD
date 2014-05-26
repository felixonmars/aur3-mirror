# Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=gnome-keyring
pkgname=lib32-${_pkgbase}
pkgver=3.12.2
pkgrel=2
pkgdesc="GNOME Password Management daemon (32 bit)"
arch=(x86_64)
url="http://www.gnome.org"
license=('GPL' 'LGPL')
depends=('lib32-gtk3' 'lib32-p11-kit' 'lib32-gcr' "${_pkgbase}") # 'libcap-ng'
makedepends=('intltool' 'gcc-multilib')
options=('!libtool' '!emptydirs')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgbase}/3.12/${_pkgbase}-${pkgver}.tar.xz)
sha256sums=('3bc39a42d445b82d24247a8c39eeb0eef7ecb1c8ebb8e6ec62671868be93fd4c')

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd ${_pkgbase}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --with-pam-dir=/usr/lib32/security \
      --with-root-certs=/etc/ssl/certs \
      --disable-schemas-compile  \
      --libexecdir=/usr/lib32/${_pkgbase} \
      --libdir=/usr/lib32
  make
}

package() {
  make -C ${_pkgbase}-${pkgver} DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{bin,include,share}}
}

