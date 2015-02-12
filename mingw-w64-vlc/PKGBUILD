
pkgname=mingw-w64-vlc
_majordotminor=2.1
pkgver=${_majordotminor}.5
pkgrel=5
pkgdesc='A multi-platform MPEG, VCD/DVD, and DivX player (mingw-w64)'
arch=('any')
url="http://www.videolan.org/vlc/"
license=('LGPL2.1' 'GPL2')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=('!buildflags' 'staticlibs' '!strip')
source=("http://download.videolan.org/vlc/${pkgver}/vlc-${pkgver}.tar.xz")
md5sums=('3941b561f590cc95ca5e795213cba2f2')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    unset LDFLAGS
    for _arch in ${_architectures}; do
        mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}
        ../vlc-${pkgver}/configure \
            --disable-lua \
            --disable-mad \
            --disable-avcodec \
            --disable-swscale \
            --disable-a52 \
            --disable-dbus \
            --prefix=/usr/$_arch \
            --host=$_arch
        make
    done
}

package() {
    for _arch in ${_architectures}; do
        cd ${srcdir}/build-${_arch}
        make DESTDIR=${pkgdir} install
        ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
        ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    done
}

build_old() {
  cd "${srcdir}/vlc-${pkgver}"

  for _arch in ${_architectures}; do
    (   set -x
        export PKG_CONFIG_LIBDIR="$PWD/contrib/$_arch/lib/pkgconfig"
        export PKG_CONFIG_PATH="$PWD/contrib/$_arch/lib/pkgconfig:$PKG_CONFIG_PATH"
        export PKG_CONFIG="pkg-config"
        CONTRIB_DIR="$PWD/contrib/$_arch"

        mkdir -p contrib/win32
        pushd contrib/win32
        ../bootstrap --host=$_arch
        if [[ -e ../$_arch ]]; then
            rm -rf ../$_arch
            #cd ../$_arch
            #../src/change_prefix.sh
        #else
        fi
        make -B PREBUILT_URL=ftp://ftp.videolan.org/pub/videolan/contrib/$_arch/vlc-contrib-$_arch-20140805.tar.bz2 prebuilt
        rm -f ../$_arch/bin/moc ../$_arch/bin/uic ../$_arch/bin/rcc
        popd

        ./bootstrap

        mkdir -p "build-$_arch"
        pushd "build-$_arch"
        echo "PKG_CONFIG_PATH=$PKG_CONFIG_PATH"
        echo "PKG_CONFIG_LIBDIR=$PKG_CONFIG_LIBDIR"
        ../configure --host=$_arch --with-contrib="$CONTRIB_DIR"
        #../extras/package/win32/configure.sh --host=$_arch --disable-dvdread
        make
        popd
    )
  done
}

package_old() {
  cd "${srcdir}/vlc-${pkgver}"

  for _arch in ${_architectures}; do
    (   set -x
        export PKG_CONFIG_LIBDIR="$PWD/contrib/$_arch/lib/pkgconfig"
        export PKG_CONFIG_PATH="$PWD/contrib/$_arch/lib/pkgconfig:$PKG_CONFIG_PATH"
        pushd "build-$_arch"
        export PKG_CONFIG_LIBDIR="${srcdir}/vlc-${pkgver}/contrib/$_arch/lib/pkgconfig"
        make DESTDIR="$pkgdir" install
        popd
    )
  done
}

