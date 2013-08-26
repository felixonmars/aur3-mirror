# Maintainer: X0rg

pkgname=lib32-gnustep-base-clang-svn
_svnname=gnustep-base
pkgver=37018
pkgrel=1
pkgdesc="The GNUstep base package, using Clang (32-bit)"
arch=('x86_64')
url="http://www.gnustep.org/"
license=('GPL2' 'GPL3' 'LGPL3')
groups=('lib32-gnustep-clang-svn')
depends=('lib32-libffi' 'lib32-libxml2' 'lib32-libxslt' 'lib32-openssl' 'lib32-gnutls' 'lib32-icu' 'lib32-avahi' 'gnustep-base-clang-svn')
makedepends=('svn' 'clang' 'lib32-gnustep-libobjc2-clang-svn' 'lib32-gmp' 'lib32-libgcrypt' 'lib32-zlib' 'lib32-glibc')
optdepends=('iconv: only if you don`t have glibc')
options=('!emptydirs' '!buildflags' 'purge')
source=("$_svnname::svn://svn.gna.org/svn/gnustep/libs/base/trunk/")
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
  OBJCFLAGS=-fblocks CC="clang -m32" CXX="clang++ -m32" ./configure --sysconfdir=/opt/GNUstep32/etc --prefix=/opt/GNUstep32 --libexecdir=/usr/lib32 --libdir=/usr/lib32 --with-config-file=/opt/GNUstep32/etc/GNUstep/GNUstep.conf \
  --with-ffi-include=/usr/lib32/libffi-`pacman -Q lib32-libffi | cut -f2 -d\ |cut -f1 -d-`/include/

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

  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Corrige les permissions..."
  else
    msg2 "Fix permissions..."
  fi
  chown -Rc root:root "$pkgdir/"

  PURGE_TARGETS=(*.gz)
}