# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# package version generated with # git log -1 --date=short --format="%cd.%h" | tr -d '-'

pkgname=kodi-audioencoder-vorbis-devel
_gitname=audioencoder.vorbis
pkgver=20150227.d556a68
_gitver=d556a6872e59806526f208e8d0af5f886a6c67bb
pkgrel=1
pkgdesc='Vorbis encoder addon for Kodi'
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
