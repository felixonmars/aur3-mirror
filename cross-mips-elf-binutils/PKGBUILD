# $Id$
# Maintainer: Nicolas Hureau <nicolas@lse.epita.fr>

_target=mips-elf
_sysroot=/usr/lib/cross-${_target}

_pkgname=binutils
pkgname=cross-${_target}-${_pkgname}
pkgver=2.21.1
pkgrel=1
pkgdesc="A set of programs to assemble and manipulate binary and object files"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/binutils/"
license=('GPL')
depends=('glibc>=2.10.1' 'zlib')
options=('!libtool' '!distcc' '!ccache')
source=(http://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2)
md5sums=('bde820eac53fa3a8d8696667418557ad')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    mkdir -p _build && cd _build

    ../configure --prefix=${_sysroot} --bindir=/usr/bin \
        --with-sysroot=${_sysroot} \
        --build=$CHOST --host=$CHOST --target=${_target} \
        --with-gcc --with-gnu-as --with-gnu-ld \
        --enable-shared --without-included-gettext \
        --disable-nls --disable-debug

    make || return 1
    make DESTDIR=${pkgdir}/ install || return 1

    # clean-up cross compiler root
    rm -rf ${pkgdir}/${_sysroot}/{info,man}
}
