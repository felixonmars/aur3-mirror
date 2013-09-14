# Maintainer: X0rg

pkgname=lib32-gnustep-gui-clang-svn
_svnname=gnustep-gui
pkgver=37078
pkgrel=2
pkgdesc="The GNUstep GUI class library, using Clang (32-bit)"
arch=('x86_64')
url="http://www.gnustep.org/"
license=('GPL3' 'LGPL3')
groups=('lib32-gnustep-clang-svn')
depends=('lib32-libtiff' 'lib32-libjpeg-turbo' 'lib32-libpng' 'lib32-giflib' 'lib32-libcups' 'lib32-icu' 'lib32-aspell' 'gnustep-gui-clang-svn')
makedepends=('svn' 'clang' 'lib32-gnustep-base-clang-svn' 'lib32-portaudio>=19' 'lib32-libao')
optdepends=('lib32-libsndfile')
options=('!emptydirs')
source=("$_svnname::svn://svn.gna.org/svn/gnustep/libs/gui/trunk/")
md5sums=('SKIP')

pkgver() {
  cd $_svnname
  svnversion | tr -d [A-z]
}

prepare() {
  cd $_svnname
  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Patche le fichier 'NSBitmapImageRep+PNG.m'..."
  else
    msg2 "Patch 'NSBitmapImageRep+PNG.m' file..."
  fi
  (set -x ; sed -i 's|png_sizeof|sizeof|g' Source/NSBitmapImageRep+PNG.m)
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
  OBJCFLAGS=-fblocks CC="clang -m32" CXX="clang++ -m32" LDFLAGS="-L/opt/GNUstep32/lib32 -L/usr/lib32" ./configure --enable-libgif --sysconfdir=/opt/GNUstep32/etc --prefix=/opt/GNUstep32 --libexecdir=/usr/lib32 --libdir=/usr/lib32

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