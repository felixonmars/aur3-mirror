# Maintainer: josephgbr <rafael.f.f1 at gmail dot com>

_pkgbase=atkmm
pkgname=lib32-$_pkgbase
pkgver=2.22.7
pkgrel=1
pkgdesc="C++ bindings for atk (32 bit)"
arch=('x86_64')
license=('LGPL')
depends=('lib32-atk' 'lib32-glibmm' 'lib32-libsigc++' "$_pkgbase")
makedepends=('gcc-multilib' )
options=('!libtool' '!emptydirs')
url="http://www.gtkmm.org/"
source=(http://ftp.gnome.org/pub/GNOME/sources/atkmm/2.22/atkmm-${pkgver}.tar.xz)
sha256sums=('bfbf846b409b4c5eb3a52fa32a13d86936021969406b3dcafd4dd05abd70f91b')

build() {
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
#  export CPPFLAGS="$CPPFLAGS -I/usr/lib/glibmm-2.4/include" # glibmmconfig.h
  
  cd ${_pkgbase}-${pkgver}
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd ${_pkgbase}-${pkgver}
  sed -i -e 's/^doc_subdirs/#doc_subdirs/' Makefile
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,lib32/atkmm*}
  # note: atkmmconfig.h removed from this lib32 package, use it from 'atkmm'
}
