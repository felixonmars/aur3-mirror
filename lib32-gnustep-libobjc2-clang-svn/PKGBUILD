# Maintainer: X0rg

pkgname=lib32-gnustep-libobjc2-clang-svn
_svnname=gnustep-libobjc2
pkgver=37018
pkgrel=1
pkgdesc="The GNUstep Objective-C runtime is designed as a drop-in replacement for the GCC runtime, using Clang (32-bit)"
arch=('x86_64')
url="http://www.gnustep.org/"
license=('custom')
groups=('lib32-gnustep-clang-svn')
depends=('lib32-gcc-libs' 'gnustep-libobjc2-clang-svn')
makedepends=('svn' 'clang' 'lib32-llvm' 'lib32-gnustep-make-clang-svn')
options=('!buildflags')
source=("$_svnname::svn://svn.gna.org/svn/gnustep/libs/libobjc2/trunk/")
md5sums=('SKIP')

pkgver() {
  cd $_svnname
  svnversion | tr -d [A-z]
}

prepare() {
  cd $_svnname
  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Créé le dossier 'build'..."
  else
    msg2 "Create 'build' directory..."
  fi
  mkdir -v ./build

  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Supprime le fichier 'GNUmakefile'..."
  else
    msg2 "Delete 'GNUmakefile' file..."
  fi
  rm -v ./GNUmakefile
}

build() {
  cd $_svnname/build

  source "/etc/profile.d/GNUstep32.sh"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export LLVM_CONFIG="/usr/bin/llvm-config32"

  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Exécute 'cmake'..."
  else
    msg2 "Run 'cmake'..."
  fi
  OBJCFLAGS="-fblocks" CFLAGS=-m32 ASMFLAGS=-m32 CC="clang -m32" CXX="clang++ -m32" cmake .. -DCMAKE_INSTALL_PREFIX=/opt/GNUstep32 -DGNUSTEP_CONFIG=/opt/GNUstep32/bin/gnustep-config

  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Exécute 'make'..."
  else
    msg2 "Run 'make'..."
  fi
  make
}

# check() {
#   cd $_svnname/build
#   make test
# }

package() {
  cd $_svnname/build
  make DESTDIR="$pkgdir" install
}