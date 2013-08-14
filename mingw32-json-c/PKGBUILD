# Maintainer: Jeffrey Tolar <tolar.jeffrey at gmail dot com>
# Contributor: Julien Quintard <mycure [at] gmail [dot] com>

_pkgname=json-c
pkgname=mingw32-$_pkgname
pkgver=0.11
pkgrel=1
pkgdesc="A JSON implementation in C (mingw32)"
arch=('i686' 'x86_64')
url="https://github.com/json-c/json-c/wiki"
license=('MIT')
makedepends=(mingw32-binutils mingw32-gcc)
source=("https://s3.amazonaws.com/${_pkgname}_releases/releases/${_pkgname}-${pkgver}-nodoc.tar.gz")
md5sums=('4ac9dae7cc2975dba7bc04b4c0b98953')
options=('!strip' '!buildflags')

build()
{
    cd "$srcdir/${_pkgname}-${pkgver}"
    export ac_cv_func_malloc_0_nonnull=yes # Use malloc() instead of rpl_malloc()
    export ac_cv_func_realloc_0_nonnull=yes # Use realloc() instead of rpl_realloc()
    ./configure --prefix=/usr/i486-mingw32 --build=$CHOST --host=i486-mingw32
    make
}

package()
{
    cd "$srcdir/${_pkgname}-${pkgver}"
    make DESTDIR=$pkgdir install
}
