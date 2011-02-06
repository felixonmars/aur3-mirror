# Maintainer: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Maintainer: Yrij Tulakov <w00zy@yandex.ru>
pkgname=lxterminal-ru
pkgver=0.1.4
pkgrel=1
_pkgname=lxterminal
pkgdesc="VTE-based terminal emulator (part of LXDE) (Russian lang patch include)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://lxde.org/"
groups=('lxde')
depends=('gtk2' 'vte')
makedepends=('pkgconfig')
replaces=('lxterminal')
provides=('lxterminal')
conflicts=('lxterminal')

source=(http://downloads.sourceforge.net/sourceforge/lxde/${_pkgname}-${pkgver}.tar.gz
ru.patch)


build() {
    cd "$srcdir/$_pkgname-$pkgver"
    patch -Np1 -i $srcdir/ru.patch || return 1
    ./configure --sysconfdir=/etc --prefix=/usr || return 1
    make || return 1
    make DESTDIR="$pkgdir" install || return 1
}
md5sums=('996ca3002531a0f251ca06856d32b53b'
         '8640008e07eaba50e0eb218e3207578f')
