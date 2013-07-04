# Maintainer: X0rg

pkgname=gnustep-base-clang-git
_gitname=gnustep-base
pkgver=9499.2e10d40
pkgrel=2
pkgdesc="The GNUstep base package, using Clang"
arch=('any')
url="http://www.gnustep.org/"
license=('GPL3' 'LGPL3')
groups=('gnustep-clang-git')
depends=('libffi' 'libxml2' 'libxslt' 'openssl' 'gnutls' 'icu' 'avahi')
makedepends=('git' 'clang' 'gnustep-libobjc2-clang-git')
optdepends=('iconv: only if you don`t have glibc')
conflicts=('gnustep-base' 'gnustep-base-svn')
options=('!emptydirs' '!buildflags')
source=('git://github.com/gnustep/gnustep-base.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $_gitname
  source /etc/profile.d/GNUstep.sh

  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Exécute 'configure'..."
  else
    msg2 "Run 'configure'..."
  fi
  OBJCFLAGS=-fblocks CC=clang CXX=clang++ ./configure --prefix=/usr --sysconfdir=/etc/GNUstep \
  --with-ffi-include=/usr/lib/libffi-`pacman -Q libffi | cut -f2 -d\ |cut -f1 -d-`/include/

  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Exécute 'make'..."
  else
    msg2 "Run 'make'..."
  fi
  make
}

# check() {
#   cd $_gitname
#   make check
# }

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
  chown -R root.root "$pkgdir/"
}