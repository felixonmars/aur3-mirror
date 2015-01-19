# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Lightning <sgsdxzy@gmail.com>

pkgname=dolphin-emu-git-64fix
pkgver=4.0.2.r5116.0acbb88
pkgrel=1
pkgdesc='A GameCube / Wii / Triforce emulator'
arch=('x86_64')
url='http://www.dolphin-emu.org/'
license=('GPL2')
depends=('bluez-libs' 'ffmpeg' 'libao' 'lzo' 'miniupnpc' 'polarssl' 'portaudio'
         'sdl2' 'sfml' 'soundtouch' 'wxgtk' 'xdg-utils')
makedepends=('cmake' 'git')
optdepends=('pulseaudio: PulseAudio backend')
provides=('dolphin-emu')
conflicts=('dolphin-emu')
options=('!emptydirs')
source=('dolphin-emu::git+https://github.com/dolphin-emu/dolphin.git' '64-bit-Linux.patch')
sha256sums=('SKIP' '4911914711f3a6915dcb62402bb6df042dcc93c51e471fce2f2a8482503d0028')

pkgver() {
  cd dolphin-emu

  _tag='4.0.2'

  printf "%s.r%s.%s" "${_tag}" "$(git rev-list --count ${_tag}..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd dolphin-emu

  patch -Np1 < $srcdir/64-bit-Linux.patch
}

build() {
  cd dolphin-emu

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_CXX_FLAGS='-fno-inline-functions' \
    -DENABLE_LTO='TRUE'
  make
}

package() {
  cd dolphin-emu/build

  make DESTDIR="${pkgdir}" install
  install -m 755 Binaries/dolphin-emu-nogui "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
