pkgname=mingw-w64-qt4pas
pkgver=2.5
pkgrel=2
pkgdesc="Free Pascal Qt4 Binding Library (mingw-w64)"
arch=(any)
url="http://users.telenet.be/Jan.Van.hijfte/qtforfpc/fpcqt4.html"
license=("LGPL")
makedepends=(mingw-w64-gcc)
depends=(mingw-w64-crt mingw-w64-qt4)
options=(staticlibs !strip !buildflags)
source=("http://users.telenet.be/Jan.Van.hijfte/qtforfpc/V$pkgver/qt4pas-V${pkgver}_Qt4.5.3.tar.gz")
md5sums=('8249bc17e4167e077d22c7f5fb118bb2')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	cd "$srcdir"
  for _arch in ${_architectures}; do
		mkdir "build-${_arch}"
		cp -r "qt4pas-V${pkgver}_Qt4.5.3/"* "build-${_arch}"
		pushd "build-${_arch}"
    unset LDFLAGS
    ${_arch}-qmake Qt4Pas.pro
    if [ ${_arch} = 'x86_64-w64-mingw32' ]; then
      sed -i "s,-mthreads,-mthreads -fpermissive," Makefile
    fi
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    install -Dm644 libQt4Pas5.a "$pkgdir/usr/${_arch}/lib/libQt4Pas5.a"
    install -Dm644 Qt4Pas5.dll "$pkgdir/usr/${_arch}/bin/Qt4Pas5.dll"
    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
  done
}