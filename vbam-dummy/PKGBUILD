# Maintainer: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=vbam-dummy
pkgver=1.8.0.r1231
pkgrel=1
arch=('i686' 'x86_64')
url='http://vba-m.com'
license=('GPL2')
makedepends=('cairo' 'chrpath' 'cmake' 'desktop-file-utils' 'ffmpeg-compat' 'gtkglextmm'
             'imagemagick' 'openal' 'subversion' 'wxgtk2.8' 'zip')
[[ $CARCH == i686 ]] && makedepends+=('nasm')
source=("vbam::svn://svn.code.sf.net/p/vbam/code/trunk")
sha256sums=('SKIP')

pkgver() {
  cd vbam

  printf "1.8.0.r%s" "$(svnversion)"
}

prepare() {
  cd vbam

  sed 's/wxrc/wxrc-2.8/g' -i {po/update_pot.sh,src/wx/CMakeLists.txt}
  sed 's/fn, fnbuf/fn/' -i src/wx/panel.cpp
}

build() {
  cd vbam

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  export PKG_CONFIG_PATH='/usr/lib/ffmpeg-compat/pkgconfig'

  if [[ $CARCH == i686 ]]; then
    cmake .. -DCMAKE_INSTALL_PREFIX='/usr' \
             -DCMAKE_EXE_LINKER_FLAGS='-L/usr/lib/ffmpeg-compat' \
             -DENABLE_{FFMPEG,GTK,WX}='TRUE' \
             -DENABLE_ASM_{CORE,SCALERS}='TRUE' \
             -DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config-2.8' \
             -DwxWidgets_wxrc_EXECUTABLE='/usr/bin/wxrc-2.8'
  else
    cmake .. -DCMAKE_INSTALL_PREFIX='/usr' \
             -DCMAKE_EXE_LINKER_FLAGS='-L/usr/lib/ffmpeg-compat' \
             -DENABLE_{FFMPEG,GTK,WX}='TRUE' \
             -DwxWidgets_CONFIG_EXECUTABLE='/usr/bin/wx-config-2.8' \
             -DwxWidgets_wxrc_EXECUTABLE='/usr/bin/wxrc-2.8'
  fi
  make
}

package() {
pkgdesc="Nintendo GameBoy Advance emulator - CLI version"
depends=('glu' 'libpng' 'libsm' 'mesa' 'sdl')
backup=('etc/vbam.cfg')

  cd vbam/build

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin/{g,wx}vbam,share}
}

# vim: ts=2 sw=2 et:
