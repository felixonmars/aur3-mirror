# Contributor: Tomas Kopecny <georgo10@gmail.com>

pkgname=wmmsg
pkgver=1.0.1
pkgrel=1
pkgdesc="wmmsg informs you of new events by displaying their icons and arrival times"
url="http://swapspace.net/~matt/wmmsg/"
license="GPL"
depends=('gtk' 'libxpm' 'imlib2' 'libxi' 'freetype2')
makedepends=()
conflicts=()
replaces=()
backup=()
arch=('i686' 'x86_64')
source=(http://swapspace.net/~matt/wmmsg/$pkgname-$pkgver.tar.bz2)
md5sums=('ceea87ef8acca7e685701bf03bb77fc8')

build() {
        cd $startdir/src/$pkgname-$pkgver
        ./configure --prefix=/usr/
        make || return 1
        make DESTDIR=$startdir/pkg install
}

