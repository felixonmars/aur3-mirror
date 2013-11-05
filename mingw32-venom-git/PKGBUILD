# Maintainer: naxuroqa <naxuroqa@gmail.com>
pkgname=mingw32-venom-git
_gitname=Venom
pkgver=165.599e1cb
pkgrel=1
pkgdesc="A Vala/Gtk+ GUI for Tox (mingw32)"
arch=('i686' 'x86_64')
url="https://github.com/naxuroqa/Venom"
license=('GPL')
makedepends=('mingw32-gcc' 'mingw32-pkg-config' 'git' 'cmake' 'vala>=0.17')
depends=('mingw32-runtime' 'mingw32-tox' 'mingw32-libgee>=0.8' 'mingw32-gtk3>=3.2')
conflicts=('mingw32-venom')
provides=('mingw32-venom')
options=('!strip' '!buildflags')
source=("git://github.com/naxuroqa/Venom.git")
md5sums=('SKIP')
_prefix="i486-mingw32"

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_gitname"
  unset LDFLAGS

  mkdir build && cd build
  cmake \
    -DPKG_CONFIG_EXECUTABLE="/usr/bin/${_prefix}-pkg-config" \
    -DCMAKE_INSTALL_PREFIX="/usr/$_prefix/" \
    -DCMAKE_TOOLCHAIN_FILE="$srcdir/cmake-toolchain.cmake" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_FLAGS="-mwindows" \
    ..
  make
}

package() {
  cd "$srcdir/$_gitname"

  cd build
  make DESTDIR="$pkgdir" install
}
