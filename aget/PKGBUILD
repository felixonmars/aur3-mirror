# Maintainer: Lukas Hübner <mail@lukashuebner.net>
pkgname=aget
pkgver=0.4.1
pkgrel=2
pkgdesc="Simple multithreaded command line downloader."
arch=('i686' 'x86_64')
url="http://www.enderunix.org/aget/"
license=('GPL')
depends=('glibc')
options=()
changelog=
source=("http://www.enderunix.org/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=(d17393c7f44aab38028ae71f14b572ba1839b6e085fb2092b6ebe68bc931df4d)

build() {
    cd "$srcdir/$pkgname-$pkgver"

    sed 's/h_addr/h_addr_list[0]/g' \
        Head.c > Head.c.tmp && mv Head.c{.tmp,}
    
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    sed -e "s/\/usr\/local\/bin/\/usr\/bin/" \
        -e "s/\/usr\//\${DESTDIR}\/usr\//" \
        Makefile > Makefile.tmp && mv Makefile{.tmp,}
    
    mkdir -p ${pkgdir}/usr/{bin,share/man/man1}/
    make DESTDIR="${pkgdir}" install
}
