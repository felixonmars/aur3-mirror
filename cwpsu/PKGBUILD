# Maintainer:  Elder Marco <eldermarco at gmail dot com>

pkgname=cwpsu
_pkgname=cwp_su_all
pkgver=42
pkgrel=4
pkgdesc="Open source software for seismic research and seismic processing"
arch=('i686' 'x86_64')
url="http://www.cwp.mines.edu/cwpcodes/"
license=('custom')
makedepends=('libxmu' 'libxi' 'mesa' 'freeglut' 'lesstif' 'gcc-fortran')
depends=('libxmu' 'libxi' 'mesa' 'freeglut' 'lesstif')
provides=('seismic-unix')
source=("ftp://ftp.cwp.mines.edu/pub/cwpcodes/${_pkgname}_${pkgver}.tgz"
        "$pkgname-$pkgver-fix-compilers.patch"
        "$pkgname-$pkgver-fix-paths.patch"
        "$pkgname-$pkgver-no-confirm.patch"
        "$pkgname.sh"
        "$pkgname.csh")
md5sums=('258bb2b5a2617af7b3e35ff214802f60'
         'f5d35d7672f0052775703e8710a071a7'
         '95676a5e4267146bf4c050f8dfedbc67'
         '36f9ccf15b2fcd7e754a939e688cb4d7'
         '947958ab083318e61db852c0632fda03'
         '8b68ffef691a4ce58525e8433000d619')

build() {
    cd "$srcdir/src"
    patch -Np1 -i ../$pkgname-$pkgver-fix-compilers.patch
    patch -Np1 -i ../$pkgname-$pkgver-fix-paths.patch
    patch -Np1 -i ../$pkgname-$pkgver-no-confirm.patch
    export CWPROOT="$srcdir"

    # Basict set of codes
    make install

    # X-toolkit applications
    make xtinstall

    # Fortran codes
    make finstall

    # Mesa/OpenGL items
    make mglinstall

    # libcwputils
    make utils
}

package() {
    cd "$srcdir"

    # Binary files
    mkdir -p "$pkgdir/opt/$pkgname/bin"
    cp -pr bin/* "$pkgdir/opt/$pkgname/bin/"

    # Include Headers
    mkdir -p "$pkgdir/opt/$pkgname/include"
    cp -pr include/* "$pkgdir/opt/$pkgname/include/"

    # Libraries
    mkdir -p "$pkgdir/opt/$pkgname/lib/"
    cp -pr lib/* "$pkgdir/opt/$pkgname/lib/"

    # Source Code and others (Yes, the program needs this...)
    mkdir -p "$pkgdir/opt/cwpsu/src"
    for _dir in doc cwp par psplot xplot Xtcwp 3D \
                Xmcwp su tri tetra faq comp xtri; do
        cp -pr "src/$_dir" "$pkgdir/opt/cwpsu/src"
    done

    # Environment Variables
    install -d -m0755 "$pkgdir/etc/profile.d"
    install -m0755 "${pkgname}.sh" "$pkgdir/etc/profile.d"
    install -m0755 "${pkgname}.csh" "$pkgdir/etc/profile.d"

    # License file and acknowledgments
    install -d -m0755 "$pkgdir/usr/share/licenses/$pkgname"
    install -p -m0644 src/LEGAL_STATEMENT  \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -p -m0644 src/ACKNOWLEDGEMENTS \
        "$pkgdir/usr/share/licenses/$pkgname/"
}
# expandtab:tabstop=4:shiftwidth=4
