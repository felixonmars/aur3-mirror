# Maintainer: Baobab <megavillain at gmail dot com>
# Contributor: Gadget3000 <gadget3000 at msn dot com>
# Contributor: attila589 <attila589 at gmail dot com>
# Contributor: RaK dimitri-b@orange.fr

pkgname=memwrite
pkgver=1.0.3
pkgrel=2
pkgdesc="memory editor (artmoney clone)"
arch=('i686' 'x86_64')
url="http://en.congelli.eu/prog_info_memwrite.html"
license=('GPL')
depends=('wxgtk' 'gcc-libs')
makedepends=('curl')
source=("http://en.congelli.eu/download/memwrite/${pkgname}-${pkgver}.tar.gz"
        "memwrite.patch"
        "memwrite2.patch")
md5sums=('84f3e4ccb382c68518b6b952d5e1b9b1'
         '85d28e96fe811b6fcca10a092b472f5c'
         'c3881dccde7972aa7649fe91917348e5')

DLAGENTS=('http::/usr/bin/curl --cookie-jar cookies.txt %u && /usr/bin/curl -b cookies.txt -fLC - --retry 3 --retry-delay 3 -o %o %u && rm cookies.txt')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -Np1 -i ../memwrite.patch
    patch -Np1 -i ../memwrite2.patch
    ./configure --prefix=/usr
    make || return 1
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR=${pkgdir} install || return 1
}
