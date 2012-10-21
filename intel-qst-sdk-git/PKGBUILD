# $Id: $
# Maintainer: Clemens Fruhwirth <clemens@endorphin.org>

pkgname=intel-qst-sdk-git
pkgver=20121021
pkgrel=1
pkgdesc="Intel(R) Quiet System Technology (QST) SDK"
arch=('i686' 'x86_64')
license=('BSD')
url="http://software.intel.com/en-us/articles/Intel_Quiet_System_Technology_Software_Development_Kit/"
depends=('glibc' 'sh' 'libtool')
options=('!emptydirs')
source=()
md5sums=()

_gitroot="https://github.com/clefru/Intel_QST_SDK.git"
_gitname=intel-qst-sdk

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."
  if [ -d $_gitname ]; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
  else
      git clone --depth=1 $_gitroot $_gitname --branch libtoolify
  fi
  msg "GIT checkout done or server timeout"

  cd "$srcdir"/$_gitname
  make
}

package(){
  cd "$srcdir/$_gitname"
  install -d "$pkgdir/usr/lib"
  install -d "$pkgdir/usr/include"
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C src/Programs/StatTest install
}