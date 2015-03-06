# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# package version generated with # git log -1 --date=short --format="%cd.%h" | tr -d '-'

pkgname=kodi-audioencoder-lame-devel
_gitname=audioencoder.lame
pkgver=20150110.3eb59de
_gitver=3eb59de951996659c143faaabacc5f34ee9a0b81
pkgrel=1
pkgdesc='Lame MP3 encoder addon for Kodi'
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
