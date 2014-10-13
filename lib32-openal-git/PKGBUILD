# $Id: PKGBUILD 117794 2014-08-23 09:55:03Z heftig $
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

_pkgbasename=openal-git
pkgname=lib32-$_pkgbasename
pkgver=1.16.0.44.g4d36ef6
pkgrel=1
pkgdesc="A cross-platform 3D audio library (32-bit) - git version"
arch=(x86_64)
url="http://www.openal.org/"
license=(LGPL)
depends=(lib32-glibc $_pkgbasename)
makedepends=(lib32-alsa-lib "lib32-ffmpeg>=2.4.2" lib32-sdl2 lib32-sdl_sound lib32-libpulse lib32-portaudio pkgconfig cmake gcc-multilib)

_gitname="openal-soft"
source=(git://repo.or.cz/openal-soft.git)
sha1sums=('SKIP')

conflicts=('lib32-openal')
provides=("lib32-openal=$pkgver")

pkgver() {
  cd "$srcdir/$_gitname"
  local ver="$(git describe --tags)"
  ver="${ver#${_gitname}-}"
  echo "${ver//-/.}"
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  rm -rf build
  mkdir build
  cd build

  cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D LIB_SUFFIX=32 ../"$_gitname"
  make
}

package() {
  cd "$_gitname"
  make -C ../build DESTDIR="$pkgdir/" install

  rm -rf "$pkgdir"/usr/{include,share,bin}
}
