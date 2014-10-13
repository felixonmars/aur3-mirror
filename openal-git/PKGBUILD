# $Id: PKGBUILD 220461 2014-08-20 20:42:53Z heftig $
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jchu@xentac.net>

pkgname=openal-git
pkgver=1.16.0.44.g4d36ef6
pkgrel=1
pkgdesc="A cross-platform 3D audio library"
arch=(i686 x86_64)
url="http://www.openal.org/"
license=(LGPL)
depends=(ffmpeg sdl2 sdl_sound)
makedepends=(alsa-lib pkgconfig cmake libpulse qt4 fluidsynth portaudio)
optdepends=('qt4: alsoft-config GUI Configurator'
            'fluidsynth: MIDI rendering')
_gitname="openal-soft"
source=(git://repo.or.cz/openal-soft.git)
sha1sums=('SKIP')

conflicts=('openal')
provides=("openal=$pkgver")

pkgver() {
  cd "$srcdir/$_gitname"
  local ver="$(git describe --tags)"
  ver="${ver#${_gitname}-}"
  echo "${ver//-/.}"
}

build() {
  rm -rf build
  mkdir build
  cd build

  cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release ../"$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make -C ../build DESTDIR="$pkgdir/" install
  install -m644 -t "$pkgdir/usr/share/openal" env-vars.txt hrtf.txt
}
