# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# package version generated with # git log -1 --date=short --format="%cd.%h" | tr -d '-'

pkgname=kodi-addon-pvr-vdr-vnsi-devel
_gitname=pvr.vdr.vnsi
pkgver=20150301.3cc618e
_gitver=3cc618e5948eff5c41591a1d5935ef0f60665deb
pkgrel=1
pkgdesc='VDR VNSI client addon for Kodi'
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
