# Contributor: Alvaro Morais <alvarommorais at gmail dot you know what>
# Contributor: Dmitry Stropaloff (helions8@gmail.com)
# Contributor: Joel Almeida García (aullidolunar__at_gmail_._c0m)

pkgname=xfc
pkgver=4.6.0
pkgrel=1
pkgdesc="The Xfce Foundation Classes is a set of integrated C++ classes for developing Xfce applications on UNIX-like operating systems such as Linux."
url="http://xfc.xfce.org"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('gtk2>=2.6.0' 'cairo>=1.8.0' 'atk>=1.9.0' 'pango>=1.8.0' 'pkgconfig>=0.14' 'libsigc++2.0>=2.0.6' 'glib2>=2.6.0' 'gcc>=3.3.2')
makedepends=('cmake' 'git' 'doxygen>=1.3.2' 'libxfce4ui' 'libxfce4util' 'libxfcegui4')
optdepends=('libglade: for libXFCglade')
source=()
md5sums=()

# xfc root
xfc_root="git://git.xfce.org/bindings/xfc"


build() {
  git clone $xfc_root
  cd xfc
  sed -i '30 i\#include <glib.h>' core/xfc/glib/unicode.hh
  sed -i '30 i\#include <glib.h>' core/xfc/glib/mutex.hh
  sed -i '34 i\#include <glib.h>' core/xfc/glib/spawn.hh
  sed -i '35 i\#include <glib.h>' core/xfc/glib/thread.hh
  sed -i '63d' CMakeLists.txt
  sed -i '63d' CMakeLists.txt
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release
}

package() {
	cd xfc
	make DESTDIR="$pkgdir" install
}

# vim: ts=2 sw=2 et ft=sh
