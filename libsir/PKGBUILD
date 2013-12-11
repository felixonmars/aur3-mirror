# Maintainer: Rich Li <rich at dranek dot com>
pkgname=libsir
pkgver="2010_08_25"
pkgrel=3
pkgdesc="A C library for reading and writing SIR format files"
arch=('i686' 'x86_64')
url="http://www.mers.byu.edu/SIR.html"
license=('custom')
depends=()
makedepends=()
options=('staticlibs')
source=(ftp://ftp.scp.byu.edu/software/misc/sirclib.tar.gz
        update-from-old-glibc.patch
        rename-static-library.patch
        create-shared-library.patch
        fix-freq-units.patch
        LICENSE)
md5sums=('0d805c081df2a51c43a3da080e2400fe'
        '1fd15997a06eb5f36441532326d40d06'
        '6c18c81079133fce94ddb1d7e160c3b4'
        '86a6333c7b38d2976ef9a4d243506a5d'
        'b39318e8f4b28939cb66313a7e422678'
        '2326604340aa9b589665e4a56efed2c1')

prepare() {
	cd "$srcdir/c"
	patch -p1 -i "$srcdir/update-from-old-glibc.patch"
	patch -p1 -i "$srcdir/rename-static-library.patch"
	patch -p1 -i "$srcdir/create-shared-library.patch"
	patch -p1 -i "$srcdir/fix-freq-units.patch"
}

build() {
	cd "$srcdir/c"
	make
}

package() {
    cd "$srcdir"
    # License
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	cd "$srcdir/c"
    # Include files
    install -d "$pkgdir/usr/include"
    install -m644 include/{sir_ez.h,sir3.h} "$pkgdir/usr/include/"
    # Static library
    install -d "$pkgdir/usr/lib"
    install -m644 libsir.a "$pkgdir/usr/lib/"
    # Shared library
    install -d "$pkgdir/usr/lib"
    install -m755 libsir.so.1.0.1 "$pkgdir/usr/lib/"
    ldconfig -n "$pkgdir/usr/lib/"
    ln -sf "libsir.so.1" "$pkgdir/usr/lib/libsir.so"
}
