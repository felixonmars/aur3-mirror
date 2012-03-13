pkgname=mingw32-tk
pkgver=8.5.11
pkgrel=2
pkgdesc="A windowing toolkit for use with tcl (mingw32)"
arch=('any')
url="http://www.tcl.tk"
license=('custom')
makedepends=('mingw32-gcc')
depends=('mingw32-runtime' "mingw32-tcl=${pkgver}")
options=('!strip' '!buildflags')
source=("http://downloads.sourceforge.net/sourceforge/tcl/tk${pkgver}-src.tar.gz")
md5sums=('b61b72f0aad230091b100746f078b8f1')

build() {
  cd "${srcdir}/tk${pkgver}/win"
  unset LDFLAGS
  mkdir -p build && cd build
  ../configure \
    --host=i486-mingw32 \
    --prefix=/usr/i486-mingw32 \
    --with-tcl=/usr/i486-mingw32/lib \
    --enable-threads
  make
}

package() {
  cd "${srcdir}/tk${pkgver}/win/build"
  make INSTALL_ROOT=${pkgdir} install install-private-headers
  ln -sf wish85.exe "${pkgdir}/usr/i486-mingw32/bin/wish.exe"
  
  # install private headers (FS#14388)
  cd "${srcdir}/tk${pkgver}"
  for dir in compat generic generic/ttk win; do
    install -dm755 "${pkgdir}/usr/i486-mingw32/include/tk-private/$dir"
    install -m644 -t "${pkgdir}/usr/i486-mingw32/include/tk-private/$dir" $dir/*.h
  done

  # remove buildroot traces / fixes #3602
  sed -i \
  -e "s,^TK_BUILD_LIB_SPEC='-L.*/win,TK_BUILD_LIB_SPEC='-L/usr/i486-mingw32/lib," \
  -e "s,^TK_SRC_DIR='.*',TK_SRC_DIR='/usr/i486-mingw32/include'," \
  -e "s,^TK_BUILD_STUB_LIB_SPEC='-L.*/win,TK_BUILD_STUB_LIB_SPEC='-L/usr/i486-mingw32/lib," \
  -e "s,^TK_BUILD_STUB_LIB_PATH='.*/win,TK_BUILD_STUB_LIB_PATH='/usr/i486-mingw32/lib," \
  "${pkgdir}/usr/i486-mingw32/lib/tkConfig.sh"
  
  i486-mingw32-strip $pkgdir/usr/i486-mingw32/bin/*.exe
  i486-mingw32-strip -x $pkgdir/usr/i486-mingw32/bin/*.dll
  i486-mingw32-strip -g $pkgdir/usr/i486-mingw32/lib/*.a
}
