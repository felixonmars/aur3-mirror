# Maintainer: X0rg

pkgname=lib32-gnustep-corebase-clang-svn
_svnname=gnustep-corebase
pkgver=37018
pkgrel=1
pkgdesc="The GNUstep CoreBase Library is a library of general-purpose, non-graphical C objects, using Clang (32-bit)."
arch=('x86_64')
url="http://www.gnustep.org/"
license=('GPL3' 'LGPL2.1')
groups=('lib32-gnustep-clang-svn')
depends=('lib32-icu' 'gnustep-corebase-clang-svn')
makedepends=('svn' 'clang' 'lib32-gnustep-base-clang-svn')
options=('!emptydirs')
source=("$_svnname::svn://svn.gna.org/svn/gnustep/libs/corebase/trunk/")
md5sums=('SKIP')

pkgver() {
  cd $_svnname
  svnversion | tr -d [A-z]
}

build() {
  cd $_svnname

  source "/etc/profile.d/GNUstep32.sh"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export LLVM_CONFIG="/usr/bin/llvm-config32"

  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Exécute 'configure'..."
  else
    msg2 "Run 'configure'..."
  fi
  OBJCFLAGS=-fblocks CC="clang -m32" CXX="clang++ -m32" ./configure --sysconfdir=/opt/GNUstep32/etc --prefix=/opt/GNUstep32 --libexecdir=/usr/lib32 --libdir=/usr/lib32

  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Exécute 'make'..."
  else
    msg2 "Run 'make'..."
  fi
  make
}

# check() {
#   cd $_svnname
#   make check
# }

package() {
  cd $_svnname
  make DESTDIR="$pkgdir" install
}