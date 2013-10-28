# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Mariusz Szczepańczyk <mszczepanczyk@gmail.com>

pkgname=libtcejdb
pkgver=1.1.25
pkgrel=1
pkgdesc="Embedded JSON Database engine"
arch=('i686' 'x86_64')
url="http://ejdb.org"
license=('LGPL')
depends=('zlib')
source=("https://github.com/Softmotions/ejdb/archive/v${pkgver}.tar.gz")
md5sums=('361ecb868fb86bacc540a0c7b0ff6a48')

build() {
    cd "${srcdir}/ejdb-${pkgver}/tcejdb"

    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/ejdb-${pkgver}/tcejdb"

    make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=4 et:
