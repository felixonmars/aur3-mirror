# $Id: $
# Maintainer: Paulo Matias <matiasΘarchlinux-br·org>

pkgname="alliance"
pkgver="5.0_20090901"
pkgrel=1
pkgdesc="Free CAD tools and libraries for VLSI design (complete design flow from VHDL to layout)"
arch=('i686' 'x86_64')
url="http://www-asim.lip6.fr/recherche/alliance"
depends=('gcc-libs' 'lesstif' 'libxpm' 'bash')
makedepends=('gcc34')
source=("http://www-asim.lip6.fr/pub/${pkgname}/distribution/${pkgver/_*}/${pkgname}-${pkgver/_/-}.tar.gz"
        "patches.diff") 
md5sums=('f3b692c4ea9e54c040280f660b3cf170'
         '37c57d3111802404d16f254a158f319b')
license=('GPL')
options=()

build() {
    cd "${srcdir}/${pkgname}-${pkgver/_*}"
    # Patches to work with the latest bison.
    patch -b -p1 < "${srcdir}/patches.diff" || return 1
    # I could patch it to compile correctly in gcc4, but then it
    # causes random untraceable runtime errors in the druc tool.
    # So I found it more trustworthy to use gcc 3.4 rather trying
    # some ugly hack in druc, because I don't know if a hidden
    # bug would otherwise show up in another tool.
    export CC="gcc-3.4"
    export CXX="g++-3.4"
    # Compiling procedure as described in README.
    export ALLIANCE_TOP="/opt/${pkgname}-${pkgver/_*}"
    ./configure --prefix="${ALLIANCE_TOP}" --enable-alc-shared || return 1
    make DESTDIR="${pkgdir}" install || return 1
}

