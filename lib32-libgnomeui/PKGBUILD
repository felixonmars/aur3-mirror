# Maintainer: josephgbr <rafael.f.f1@gmail.com>
# Contributor: webjdm <web.jdm at gmail.com>

_pkgbase=libgnomeui
pkgname=lib32-${_pkgbase}
pkgver=2.24.5
pkgrel=1
pkgdesc="User Interface library for GNOME (32 bit)"
arch=('x86_64')
url="http://www.gnome.org"
license=('LGPL')
depends=('lib32-libbonoboui' 'lib32-libgnome-keyring' "${_pkgbase}")
makedepends=('intltool' 'gcc-multilib')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgbase}/${pkgver%.*}/${_pkgbase}-${pkgver}.tar.bz2)
sha256sums=('ae352f2495889e65524c979932c909f4629a58e64290fb0c95333373225d3c0f')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib32/libgnomeui \
      --libdir=/usr/lib32
  
  make
}

package() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr"/{include,share}
}
