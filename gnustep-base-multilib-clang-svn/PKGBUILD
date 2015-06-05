# Maintainer: X0rg

_svnname=gnustep-base
pkgname=$_svnname-multilib-clang-svn
pkgver=38274
pkgrel=8
pkgdesc="The GNUstep base package for multilib, using Clang"
arch=('x86_64')
url="http://www.gnustep.org/"
license=('GPL2' 'GPL3' 'LGPL2.1')
groups=('gnustep-multilib-clang-svn')
depends=('libffi' 'libxml2' 'libxslt' 'openssl' 'gnutls' 'icu' 'gnustep-libobjc2-multilib-clang-svn' \
	'lib32-libffi' 'lib32-libxml2' 'lib32-libxslt' 'lib32-openssl' 'lib32-gnutls' 'lib32-icu' 'lib32-libao')
makedepends=('svn' 'clang' 'gnustep-make-multilib-clang-svn')
optdepends=('iconv: only if you don`t have glibc'
	'ffcall: alternative for libffi'
	'avahi: enable NSNetServices support'
	'lib32-avahi: enable 32-bit NSNetServices support'
	'lib32-libdispatch-clang-git: enable dispatching blocks via libdispatch')
provides=('gnustep-base-clang-svn')
conflicts=('gnustep-base' 'gnustep-base-svn' 'gnustep-base-clang-svn')
install=merge.install
options=('!emptydirs')
source=("$_svnname::svn://svn.gna.org/svn/gnustep/libs/base/trunk/")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_svnname"
  svnversion | tr -d [A-z]
}

prepare() {
  msg2 "Fix permissions..."
  sed -i 's/tar -xf $(TIMEZONE_ARCHIVE);/tar -xf $(TIMEZONE_ARCHIVE);chown -R root:root * ;/' "$srcdir/$_svnname/NSTimeZones/Makefile.postamble"

  msg2 "Make a clone of $_svnname"
  cp -Rv "$srcdir/$_svnname" "$srcdir/$_svnname-32"
}

build() {
  # 64-bit build
  cd "$srcdir/$_svnname"
  msg2 "Run 'configure' (64-bit)..."
  OBJCFLAGS="-fblocks" CC="clang" CXX="clang++" ./configure --prefix=/usr --sysconfdir=/etc/GNUstep \
    --disable-unicodeconstants --with-ffi-include=/usr/lib/libffi-`pacman -Q libffi | cut -f2 -d\ |cut -f1 -d-`/include/

  msg2 "Run 'make' (64-bit)..."
  make

  # 32-bit build
  cd "$srcdir/$_svnname-32"
  source "/usr/share/GNUstep32/Makefiles/GNUstep.sh"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  msg2 "Run 'configure' (32-bit)..."
  OBJCFLAGS="-fblocks" CC="clang -m32" CXX="clang++ -m32" ./configure --prefix=/usr --libdir=/usr/lib32 --sysconfdir=/etc/GNUstep \
    --disable-unicodeconstants --with-ffi-include=/usr/lib32/libffi-`pacman -Q lib32-libffi | cut -f2 -d\ |cut -f1 -d-`/include/

  msg2 "Run 'make' (32-bit)..."
  make
}

# check() {
#   cd "$srcdir/$_svnname"
#   make check
#
#   cd "$srcdir/$_svnname-32"
#   make check
# }

package() {
  # 64-bit install
  cd "$srcdir/$_svnname"
  msg2 "Install (64-bit)..."
  GNUSTEP_CONFIG_FILE="/etc/GNUstep/GNUstep.conf" make DESTDIR="$pkgdir" install

  # 32-bit install
  cd "$srcdir/$_svnname-32"
  msg2 "Install (32-bit)..."
  GNUSTEP_CONFIG_FILE="/etc/GNUstep/GNUstep32.conf" make DESTDIR="$pkgdir" install
}
