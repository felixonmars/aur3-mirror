pkgname=mingw-w64-tk
pkgver=8.6.1
pkgrel=2
pkgdesc="A windowing toolkit for use with tcl (mingw-w64)"
arch=(any)
url="http://tcl.sourceforge.net"
license=("custom")
makedepends=(mingw-w64-gcc mingw-w64-pkg-config)
depends=(mingw-w64-crt "mingw-w64-tcl>=$pkgver")
options=(!strip !buildflags staticlibs)
source=("http://downloads.sourceforge.net/sourceforge/tcl/tk${pkgver}-src.tar.gz"
"tk-mingw-w64-compatibility-fix.patch")
sha1sums=('ecfcc20833c04d6890b14a7920a04d16f2123a51'
          'ef93155ba8a801d9d4971a25671f1dd7a2156176')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "$srcdir/tk$pkgver"
	patch -p1 -i ../tk-mingw-w64-compatibility-fix.patch
}

build() {
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cp -r "$srcdir/tk$pkgver/"* "${srcdir}/${pkgname}-${pkgver}-build-${_arch}/"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    [ "${_arch}" = 'x86_64-w64-mingw32' ] && enable64bit='--enable-64bit'
    "${srcdir}"/${pkgname#mingw-w64-}${pkgver}/win/configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      --with-tcl=/usr/${_arch}/lib $enable64bit
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    make -j1 install INSTALL_ROOT="$pkgdir"
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    find "$pkgdir/usr/${_arch}" -name '*.sh' | xargs -rtl1 chmod 755
    find "$pkgdir/usr/${_arch}" -name '*.sh' | xargs -rtl1 sed -i "s,libtk86.a,libtk86.dll.a,g"
    mv "$pkgdir/usr/${_arch}/lib/libtk86.a" "$pkgdir/usr/${_arch}/lib/libtk86.dll.a"
    ln -s "/usr/${_arch}/lib/libtk86.dll.a" "$pkgdir/usr/${_arch}/lib/libtk.dll.a"
    mkdir -p "${pkgdir}/usr/${_arch}/include/tk-private/"{generic,win}
    find generic win -name "*.h" -exec cp -p '{}' "${pkgdir}"/usr/${_arch}/include/tk-private/'{}' ';'
    ( cd "${pkgdir}/usr/${_arch}/include"
      for i in *.h ; do
        [ -f "${pkgdir}/usr/${_arch}/include/tk-private/generic/$i" ] && ln -sf ../../$i "${pkgdir}/usr/${_arch}/include/tk-private/generic" ;
      done
    ) || true
    chmod a-x "${pkgdir}/usr/${_arch}/lib/"*/pkgIndex.tcl
    sed -e "s#${srcdir}/tk${pkgver}/unix#/usr/${_arch}/lib#" \
      -e "s#${srcdir}/tk${pkgver}#/usr/${_arch}/include#" \
      -i "${pkgdir}/usr/${_arch}/lib/tkConfig.sh"
    rm "$pkgdir/usr/${_arch}/lib/tk${pkgver%.*}/tkAppInit.c"
  done
}
