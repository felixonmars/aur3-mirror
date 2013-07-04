# Maintainer: X0rg

pkgname=gnustep-opal-clang-git
_gitname=gnustep-opal
pkgver=141.43dd785
pkgrel=2
pkgdesc="Opal is a vector drawing library with an API similar to Quartz 2D, using Clang"
arch=('any')
url="http://www.gnustep.org/"
license=('LGPL2.1')
groups=('gnustep-clang-git')
depends=('cairo' 'libjpeg-turbo' 'libpng' 'libtiff' 'lcms' 'freetype2' 'fontconfig')
makedepends=('git' 'clang' 'gnustep-base-clang-git' 'gnustep-corebase-clang-git')
conflicts=('gnustep-opal-git')
source=('git://github.com/gnustep/gnustep-opal.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $_gitname
  source /etc/profile.d/GNUstep.sh

  if [[ $(locale -a | grep french) == "french" ]];then msg2 "Exécute 'make'..."
  else
    msg2 "Run 'make'..."
  fi
  OBJCFLAGS=-fblocks CC=clang CXX=clang++ make
}

package() {
  cd $_gitname
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
