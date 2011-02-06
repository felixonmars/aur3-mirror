# Maintainer: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=holdingnuts
pkgver=0.0.5
pkgrel=1
pkgdesc="A Texas Hold'em poker client and server"
arch=('i686' 'x86_64')
url="http://www.holdingnuts.net/"
license=('GPL3')
depends=('qt' 'sdl')
makedepends=('make' 'cmake>=2.6')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('666d7545f5f053237756796e6ee64b5d')

build() {
    cd $srcdir/$pkgname-$pkgver

    mkdir -p build
    cd build

    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_DATA_PATH=/usr/share

    make || return 1
    make DESTDIR=$pkgdir install || return 1

    cd ..

    install -d $pkgdir/usr/share/man/man6
    install -m 644 docs/holdingnuts{,-server}.6 $pkgdir/usr/share/man/man6/
    install -Dm 644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
    install -Dm 644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
