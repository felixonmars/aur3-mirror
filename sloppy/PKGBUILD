# Contributor: Arto Jonsson <ajonsson kapsi fi>

pkgname=sloppy
pkgver=0.2.2
pkgrel=1
pkgdesc="A cross-platform Xboard compatible chess engine"
url="http://koti.mbnet.fi/~ilaripih/sloppy/"
arch=('i686' 'x86_64')
license=('GPL3')
source=(http://koti.mbnet.fi/~ilaripih/$pkgname/files/$pkgname-$pkgver.tar.gz)
depends=('glibc')
md5sums=('ac8d2d4313c860c11b46d674f3d16249')

build() {
    cd $srcdir/$pkgname-$pkgver
    
    make -C src || return 1
    install -Dm755 src/sloppy $pkgdir/usr/bin/sloppy
}
