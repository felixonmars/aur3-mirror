# Maintainer: oke3 <Sekereg at gmx dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=mp3blaster
pkgver=3.2.5
pkgrel=3
pkgdesc="A console based mp3 and OGG player."
depends=('ncurses' 'libvorbis' 'sdl' 'libsidplay')
url="http://mp3blaster.sourceforge.net"
arch=('i686' 'x86_64')
license=('GPL')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'mp3blaster-gcc43.patch')
sha512sums=('53f623340b7a8e4be6cd973474fd5f23c623b6d1c667478dc0d4c7a1ef5758f4bbc09d9d0698d1539d8d1c3ef45301b447f3ed74f68586070a07a7f9fa8c353e'  \
    'ce2b64cfcfbbd1880f3c85c4f85acd1005c2cd4ac568bc9f5fc2b674c5a47eebcef88c69fa7a549f026d0116c09dd27d51842757c5a34f7196d46dedcbe9cd7a')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    patch -p0 -i "${srcdir}/mp3blaster-gcc43.patch"

    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make DESTDIR="$pkgdir" install
}
