# Maintainer: edubart <edub4rt@gmail.com>
pkgname=mingw-w64-physfs-hg
pkgver=20150315
pkgrel=2
pkgdesc="A library to provide abstract access to various archives (mingw-w64)"
arch=('any')
url="http://icculus.org/physfs/"
license=('ZLIB')
makedepends=('mingw-w64-gcc' 'mingw-w64-cmake' 'mercurial')
depends=('mingw-w64-zlib')
options=('!strip' '!buildflags' '!makeflags')
provides=(mingw-w64-physfs)
conflicts=(mingw-w64-physfs)
source=("hg+http://hg.icculus.org/icculus/physfs")
sha1sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare()
{
  cd $srcdir/physfs
  sed -i 's/-Werror//g' CMakeLists.txt
}

build() {
  cd $srcdir/physfs
  unset LDFLAGS
  export CFLAGS="$CFLAGS -fno-strict-aliasing"
  export CXXFLAGS="$CXXFLAGS -fno-strict-aliasing"
  for _arch in ${_architectures}; do
    mkdir -p $srcdir/physfs/build-${_arch}
    cd $srcdir/physfs/build-${_arch}
    ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release \
                    -DPHYSFS_BUILD_TEST=OFF \
                    -DPHYSFS_BUILD_WX_TEST=OFF ..
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd $srcdir/physfs/build-${_arch}
    make DESTDIR=${pkgdir} install
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
