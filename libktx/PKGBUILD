# Maintainer: Anthony Garcia <myfirstname AT lagg DOT me>
pkgname=libktx
pkgver=2.0
pkgrel=1
pkgdesc="A library for working with KTX texture files."
arch=('i686' 'x86_64')
url="http://www.khronos.org/opengles/sdk/tools/KTX"
license=('BSD')
depends=(mesa)
source=("http://www.khronos.org/opengles/sdk/tools/KTX/downloads/ktx20.tgz")
md5sums=('4b899715bf8f30c62cf480385dd7980a')
options=(staticlibs)

prepare() {
        cd "$srcdir"
        patch -p1 -i "../wchar_undefined.patch"
        patch -p1 -i "../glcorearb.h.patch"
}

build() {
	cd "$srcdir/build/GNUmake"
	make
}

package() {
	cd "$srcdir"
        install -D "build/GNUmake/lib/gl/libktx.a" "$pkgdir/usr/lib/libktx.a"
        install -d "$pkgdir/usr/include"
        cp -r include/* "$pkgdir/usr/include"
        install -t "$pkgdir/usr/include" include/*.h
}
