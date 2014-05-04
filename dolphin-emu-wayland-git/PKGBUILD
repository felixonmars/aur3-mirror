# Maintainer: Ryo Munakata <afpacket@gmail.com>
# Contributor: Ryo Munakata <afpacket@gmail.com>

pkgname=dolphin-emu-wayland-git
pkgver=4.0.r1519.a1374dd
pkgrel=1
pkgdesc="A GameCube / Wii / Triforce emulator with Wayland support"
arch=('i686' 'x86_64')
url="http://www.dolphin-emu.org/"
license=('GPL2')
depends=('bluez-libs' 'ffmpeg' 'glew' 'libao' 'libusbx' 'miniupnpc' 'openal' 'portaudio' 'sdl2' 'soundtouch' 'wxgtk')
makedepends=('cmake' 'git' 'opencl-headers')
optdepends=('pulseaudio: PulseAudio backend')
provides=("dolphin-emu" "dolphin-emu-git")
conflicts=("dolphin-emu" "dolphin-emu-git")
options=('!emptydirs')
source=(
  "${pkgname%-*}::git+https://github.com/dolphin-emu/dolphin.git"
  "dolphin-emu-wayland.sh"
)
sha256sums=(
  'SKIP'
  '7912c25154198b74b792f07272b63262efe118a2f6b8b5bc96f5acb2ccc460ce'
)

pkgver() {
  cd ${pkgname%-*}

  printf "%s" "$(git describe --tags | sed 's/-/.r/; s/-g/./')"
}

build() {
  cd ${pkgname%-*}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DUSE_EGL=1 -DDISABLE_WX=1 \
    -DUSE_X11=1 -DUSE_WAYLAND=1 \
    -DCMAKE_VERBOSE_MAKEFILE=0
  make
}

package() {
  cd ${pkgname%-*}/build

  make DESTDIR="${pkgdir}" install
  install -D -m755 "${srcdir}/dolphin-emu-wayland.sh" "${pkgdir}/usr/bin/dolphin-emu-wayland"
}

# vim: ts=2 sw=2 et:
