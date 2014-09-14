# Maintainer: naxuroqa <naxuroqa@gmail.com>
pkgname=mingw-w64-venom-git
_gitname=Venom
pkgver=615.7fa007d
pkgrel=1
pkgdesc="A Vala/Gtk+ GUI for Tox (mingw-w64)"
arch=('any')
url="https://github.com/naxuroqa/Venom"
license=('GPL')
conflicts=('mingw-w64-venom')
provides=('mingw-w64-venom')
makedepends=('git' 'mingw-w64-cmake' 'vala>=0.18.1' 'mingw-w64-pkg-config')
depends=('mingw-w64-crt' 'mingw-w64-gtk3>=3.4.1' 'mingw-w64-sqlite>=3.7.9' 'mingw-w64-json-glib>=0.14.2' 'mingw-w64-qrencode>=3.1.1' 'mingw-w64-tox-git')
options=('!strip' '!buildflags' 'staticlibs')
source=("git://github.com/naxuroqa/Venom.git")
md5sums=('SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  unset LDFLAGS
  cd "$srcdir/$_gitname"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DPKG_CONFIG_EXECUTABLE=/usr/bin/${_arch}-pkg-config \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_C_FLAGS="-mwindows -static-libgcc -static-libstdc++" \
      -DENABLE_QR_ENCODE=True \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/$_gitname/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    #${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    #${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
