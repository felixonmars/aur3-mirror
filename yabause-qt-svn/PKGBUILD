# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=yabause-qt-svn
pkgver=0.9.14.3265
pkgrel=1
pkgdesc="A Sega Saturn emulator. (SVN version)"
arch=('x86_64' 'i386')
url="http://yabause.org/"
license=('GPL')
conflicts=('yabause')
provides=('yabause')
depends=('mini18n-git' 'openal' 'sdl2' 'freeglut' 'qt5-base')
makedepends=('subversion' 'cmake')
source=("svn+https://svn.code.sf.net/p/yabause/code/trunk/yabause/")
_svnmodule="yabause"
md5sums=('SKIP')

pkgver() {
  cd "${_svnmodule}"
  _major_v="$(grep -e "YAB_VERSION_MAJOR" CMakeLists.txt -num1 | tr -d ')' | cut -d ' ' -f2)"
  _minor_v="$(grep -e "YAB_VERSION_MINOR" CMakeLists.txt -num1 | tr -d ')' | cut -d ' ' -f2)"
  _patch_v="$(grep -e "YAB_VERSION_PATCH" CMakeLists.txt -num1 | tr -d ')' | cut -d ' ' -f2)"
  echo "$(echo -n ${_major_v}.${_minor_v}.${_patch_v}).$(svnversion)"
}

prepare() {
  rm -fr build
  mkdir -p build
}

build() {
  cd build

  LDFLAGS+=",-z,noexecstack"
  cmake "../${_svnmodule}" \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DYAB_PORTS=qt \
    -DYAB_NETWORK=ON \
    -DYAB_OPTIMIZED_DMA=ON
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
