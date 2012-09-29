# Contributor: CYB3R <dima@golovin.in>
# Maintainer: CYB3R <dima@golovin.in>
# Author: ae1234 <ae@aewi.info>
pkgname=rgl
pkgver=0.2
pkgrel=3
pkgdesc="OpenGL operation reallocation library (designed for WoW under wine)"
arch=('i686' 'x86_64')
license=("GPL2")
depends=('libgl')
if test "$CARCH" == x86_64; then
    depends=('lib32-libgl')
fi
makedepends=()
url=("http://aewi.info/rgl/")
source=("http://aewi.info/rgl/${pkgname}.tgz"
        'Makefile')
 
build() {
    cp -f ../Makefile Makefile
    make || return 1
}

package() {
	install -Dm755 "${srcdir}/${pkgname}.so" "${pkgdir}/usr/lib/${pkgname}.so"
}

md5sums=('c1631f9025655b53db7ec1cdc0ebf616'
         '6177b4395265c998882350ea8e0df237')
