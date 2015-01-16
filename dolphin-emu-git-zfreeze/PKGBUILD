# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Lightning <sgsdxzy@gmail.com>

pkgname=dolphin-emu-git-zfreeze
pkgver=4.0.2.r5103.9d9ffa5
pkgrel=2
pkgdesc='A GameCube / Wii / Triforce emulator with zfreeze merged'
arch=('x86_64')
url='https://forums.dolphin-emu.org/Thread-zfreeze-testing-needed'
license=('GPL2')
depends=('bluez-libs' 'ffmpeg' 'libao' 'lzo' 'miniupnpc' 'polarssl' 'portaudio'
         'sdl2' 'sfml' 'soundtouch' 'wxgtk' 'xdg-utils')
makedepends=('cmake' 'git')
optdepends=('pulseaudio: PulseAudio backend')
provides=('dolphin-emu')
conflicts=('dolphin-emu')
options=('!emptydirs')
source=('dolphin-emu::git+https://github.com/dolphin-emu/dolphin.git' fix_surround_map.patch)
#commit=318b03e # 1788
#commit=95f097d79b
sha256sums=('SKIP')

pkgver() {
  cd dolphin-emu

  _tag='4.0.2'

  printf "%s.r%s.%s" "${_tag}" "$(git rev-list --count ${_tag}..HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd dolphin-emu
  
  # Reverts a commit that crashes when trying to initialize a MMU game (like Rogue Squadron II)
  git revert --no-edit b058bbd2237837fc05943d3c9b0e60233937f704

  # Zfeeze stuff
  git pull --no-edit 'git://github.com/NanoByte011/dolphin' real_zfreeze #https://github.com/dolphin-emu/dolphin/pull/1812/commits
  #git pull --no-edit 'git://github.com/phire/dolphin' real_zfreeze #https://github.com/dolphin-emu/dolphin/pull/1881

  # Fix pulseaudio surround mappings (may not be usefull for most)
  patch -p2 < "$srcdir/fix_surround_map.patch"
}

build() {
  cd dolphin-emu

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_CXX_FLAGS='-O3 -fno-inline-functions' \
    -DENABLE_LTO='TRUE'
  make
}

package() {
  cd dolphin-emu/build

  make DESTDIR="${pkgdir}" install
  install -m 755 Binaries/dolphin-emu-nogui "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
sha256sums=('SKIP'
            'b08329fe46bf6989722792ea65ed482358ecb0472a5e0abdc9575a52248e51e0')
