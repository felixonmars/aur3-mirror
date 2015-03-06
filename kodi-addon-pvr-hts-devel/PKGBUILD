# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# package version generated with # git log -1 --date=short --format="%cd.%h" | tr -d '-'

pkgname=kodi-addon-pvr-hts-devel
_gitname=pvr.hts
pkgver=20150224.3bc77ae
_gitver=3bc77ae4c4d261ce0210a6afff7404f7ac4ff106
pkgrel=1
pkgdesc='Tvheadend HTSP client addon for Kodi'
arch=('i686' 'x86_64')
url="https://github.com/kodi-pvr/$_gitname"
license=('GPL')
makedepends=('cmake' 'kodi-platform-devel')
depends=('kodi-devel')
source=("https://github.com/kodi-pvr/$_gitname/archive/$_gitver.tar.gz")
md5sums=('SKIP')

_prefix='/usr'

prepare() {
  msg "Starting make..."
  cd "$srcdir/$_gitname-$_gitver"
  sed 's/libXBMC_codec.h/kodi\/libXBMC_codec.h/' -i src/xbmc_codec_descriptor.hpp
}

build() {
  cd "$srcdir/$_gitname-$_gitver"
  mkdir -p build && pushd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=$_prefix \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
  popd
}

package() {
  cd "$srcdir/$_gitname-$_gitver/build"
  make DESTDIR="$pkgdir" install
}
