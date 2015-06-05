# Maintainer: X0rg

_svnname=gnustep-libobjc2
pkgname=$_svnname-multilib-clang-svn
pkgver=38274
pkgrel=5
pkgdesc="The GNUstep Objective-C runtime is designed as a drop-in replacement for the GCC runtime for multilib, using Clang"
arch=('x86_64')
url="http://www.gnustep.org/"
license=('custom:MIT')
groups=('gnustep-multilib-clang-svn')
depends=('gcc-libs-multilib')
makedepends=('svn' 'clang' 'cmake' 'gnustep-make-multilib-clang-svn')
provides=('gnustep-libobjc2-clang-svn')
conflicts=('gnustep-libobjc2-git' 'gnustep-libobjc2-clang-svn')
options=('purge')
install=merge.install
source=("$_svnname::svn://svn.gna.org/svn/gnustep/libs/libobjc2/trunk/")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_svnname"
  svnversion | tr -d [A-z]
}

prepare() {
  msg2 "Create 'build' directory..."
  mkdir -pv "$srcdir/$_svnname/build"{32,64}

  msg2 "Delete 'GNUmakefile' file..."
  rm -v "$srcdir/$_svnname/GNUmakefile"
}

build() {
  # 64-bit build
  cd "$srcdir/$_svnname/build64"
  msg2 "Run 'cmake' (64-bit)..."
  OBJCFLAGS="-fblocks" CC="clang" CXX="clang++" LDFLAGS="${LDFLAGS//,--as-needed}" cmake ..

  msg2 "Run 'make' (64-bit)..."
  make

  # 32-bit build
  cd "$srcdir/$_svnname/build32"
  source "/usr/share/GNUstep32/Makefiles/GNUstep.sh"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  msg2 "Run 'cmake' (32-bit)..."
  OBJCFLAGS="-fblocks" ASMFLAGS="-m32" CC="clang -m32" CXX="clang++ -m32" LDFLAGS="${LDFLAGS//,--as-needed}" cmake ..

  msg2 "Run 'make' (32-bit)..."
  make
}

# check() {
#   cd "$srcdir/$_svnname/build64"
#   make test
#
#   cd "$srcdir/$_svnname/build32"
#   make test
# }

package() {
  # 64-bit install
  cd "$srcdir/$_svnname/build64"
  msg2 "Install (64-bit)..."
  make DESTDIR="$pkgdir" install

  # 32-bit install
  cd "$srcdir/$_svnname/build32"
  msg2 "Install (32-bit)..."
  make DESTDIR="$pkgdir" install
  PURGE_TARGETS="$pkgdir/usr/lib*/libobjc.so"

  msg2 "Install the license..."
  install -Dvm644 "../COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
