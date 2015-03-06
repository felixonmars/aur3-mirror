# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# package version generated with # git log -1 --date=short --format="%cd.%h" | tr -d '-'

pkgname=kodi-audioencoder-flac-devel
_gitname=audioencoder.flac
pkgver=20150227.84acb14
_gitver=84acb14101b9114472cd20f6a0f8fdefbb376113
pkgrel=1
pkgdesc='Flac encoder addon for Kodi'
arch=('i686' 'x86_64')
url="https://github.com/xbmc/$_gitname"
license=('GPL')
makedepends=('cmake')
depends=('kodi-devel')
source=("https://github.com/xbmc/$_gitname/archive/$_gitver.tar.gz")
md5sums=('SKIP')

_prefix='/usr'

prepare() {
  msg "Starting make..."
  cd "$srcdir/$_gitname-$_gitver"
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
