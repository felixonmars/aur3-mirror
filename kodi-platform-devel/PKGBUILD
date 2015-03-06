# Maintainer: dhead666 <myfoolishgames@gmail.com>
# https://github.com/dhead666/archlinux-pkgbuilds
#
# package version generated with # git log -1 --date=short --format="%cd.%h" | tr -d '-'

pkgname=kodi-platform-devel
_gitname=kodi-platform
pkgver=20150221.68315f0
_gitver=68315f04d8a7c3bc4833af7bd56f5b7d905d351d
pkgrel=1
pkgdesc='Kodi platform environment for compiling cmake binary addons'
arch=('i686' 'x86_64')
url="https://github.com/xbmc/$_gitname"
license=('GPL')
makedepends=('cmake')
depends=('kodi-devel' 'tinyxml')
conflicts=('kodi-platform')
source=("https://github.com/xbmc/$_gitname/archive/$_gitver.tar.gz")
md5sums=('SKIP')

_prefix='/usr'

build() {
  cd "$srcdir/$_gitname-$_gitver"
  mkdir -p build && pushd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=$_prefix \
    -DCMAKE_INSTALL_LIBDIR="$_prefix/lib" \
    -DCMAKE_INSTALL_LIBDIR_NOARCH="$_prefix/lib" \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
  popd
}

package() {
  cd "$srcdir/$_gitname-$_gitver/build"
  make DESTDIR="$pkgdir" install
}
