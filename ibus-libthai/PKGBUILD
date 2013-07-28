# Modified from libthai's PKGBUILD

pkgname=ibus-libthai
pkgver=0.1.1
pkgrel=1
pkgdesc="Thai input method engine for IBus"
url="http://linux.thai.net/projects/libthai"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('libthai' 'ibus')
makedepends=('pkgconfig')
options=('!libtool' '!emptydirs')
source=(http://linux.thai.net/pub/thailinux/software/libthai/${pkgname}-${pkgver}.tar.xz)
md5sums=('5fb5a6d63944e61db05c1b6353d83850')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr --disable-static
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
