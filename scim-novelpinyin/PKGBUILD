# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Lyman Li <lymanrb@gmail.com>

_pkgname=novel-pinyin
pkgname=scim-novelpinyin
pkgver=0.2.5
pkgrel=2
pkgdesc="A Simplified Chinese sentence-based pinyin input method engine based on Markov modeling"
arch=(i686 x86_64)
url=http://sourceforge.net/projects/$_pkgname
license=(GPL2)
depends=(scim)
options=(!libtool)
source=(http://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('01edcd75000b80249eb3c0bcce9c7e76fa42aa8cbec0907c97e5c1404e6a7945')
sha512sums=('cb28b6dc585d402c720d2ce41903e693fec5c649c01a49b4617d2dcea9d1ac6b6dc414424385ba9cab53cc801c8297263b55a025f0a4ee7d87f0cf626c1158dd')

build() {
    cd "$srcdir"/$_pkgname-$pkgver/
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir"/$_pkgname-$pkgver/
    make DESTDIR="$pkgdir" install
}
