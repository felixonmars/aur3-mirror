pkgname=mingw-w64-wxmsw2.9
pkgver=2.9.4
pkgrel=8
pkgdesc="MSW implementation of wxWidgets API for GUI (mingw-w64)"
arch=(any)
url="http://wxwidgets.org"
license=("custom:wxWindows")
makedepends=(mingw-w64-gcc)
depends=(mingw-w64-crt
mingw-w64-libjpeg-turbo
mingw-w64-libpng
mingw-w64-expat
mingw-w64-libtiff)
options=(!libtool !strip !buildflags)
conflicts=(mingw-w64-wxmsw2.9-static)
provides=(mingw-w64-wxmsw2.9-static)
source=("http://downloads.sourceforge.net/wxwindows/wxWidgets-$pkgver.tar.bz2"
"http://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win32/Personal%20Builds/rubenvb/gcc-4.7-release/i686-w64-mingw32-gcc-4.7.4-release-linux64_rubenvb.tar.xz"
"http://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win64/Personal%20Builds/rubenvb/gcc-4.7-release/x86_64-w64-mingw32-gcc-4.7.4-release-linux64_rubenvb.tar.xz")
md5sums=('f1348f740a569ce2945512d5b0e70e87'
         '30578855ad61011b902ebfd79f43adbc'
         '5fb5e8ce6b7c4d4c6144e9b65bfc139c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  mv "${srcdir}/mingw64" "${srcdir}/x86_64-w64-mingw32-mingw"
  mv "${srcdir}/mingw32" "${srcdir}/i686-w64-mingw32-mingw"
}

build() {
  for _arch in ${_architectures}; do
    unset LDFLAGS
    export PATH="${srcdir}/${_arch}-mingw/bin:${srcdir}/${_arch}-mingw/${_arch}/bin:$PATH"
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    ${srcdir}/wxWidgets-${pkgver}/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --with-msw \
      --disable-mslu \
      --enable-compat26 \
      --enable-shared \
      --enable-iniconf \
      --enable-std_string_conv_in_wxstring
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    export PATH="${srcdir}/${_arch}-mingw/bin:${srcdir}/${_arch}-mingw/${_arch}/bin:$PATH"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make DESTDIR="$pkgdir" install
    mv "$pkgdir/usr/${_arch}/lib/"*.dll "$pkgdir/usr/${_arch}/bin"
    find "$pkgdir/usr/${_arch}" -name '*.exe' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm "$pkgdir/usr/${_arch}/bin/wx"{-config,rc-2.9}
    ln -s "/usr/${_arch}/lib/wx/config/${_arch}-msw-unicode-2.9" "$pkgdir/usr/${_arch}/bin/wx-config"
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
