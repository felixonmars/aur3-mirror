# Contributor: Stas Elensky <stas-at-flexsys-dot-com-dot-ua>

pkgname=mingw32-libmodbus
pkgver=3.0.5
pkgrel=1
pkgdesc="A Modbus library for Linux, Mac OS X, FreeBSD, QNX and Win32 (mingw32)"
arch=('any')
url="http://libmodbus.org/"
license=('LGPL')
groups=()
depends=('mingw32-runtime')
makedepends=('mingw32-gcc')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip !buildflags staticlibs)
install=
_pkgfqn="libmodbus-${pkgver}"
source=(http://github.com/stephane/libmodbus/archive/v$pkgver.tar.gz)
md5sums=('d72726ef748059b4abd85de3116e1f25')
noextract=()


build() {
  unset CFLAGS
  unset LDFLAGS

  cd "$srcdir/$_pkgfqn"
  ./autogen.sh
  ./configure --prefix=/usr/i486-mingw32 --host=i486-mingw32 --without-documentation
  make
}

package() {
  cd "$srcdir/$_pkgfqn"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
