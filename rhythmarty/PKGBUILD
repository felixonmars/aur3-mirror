# Maintainer: Alexandr Grigorcea <cahr dot gr at gmail dot com>

pkgname=rhythmarty
pkgver=0.4
pkgrel=1
pkgdesc="A plugin for rhythmbox music player, that let you browse your music collection via album art display"
url="http://sourceforge.net/projects/rhythmarty/"
arch=('i686' 'x86_64')
license=('GPL')
source=(http://downloads.sourceforge.net/project/rhythmarty/rhythmarty-0.4/rhythmarty-0.4.tar.gz)
depends=('rhythmbox')
makedepends=()
md5sums=('d155fb1bf30c982cc3f2a40e2c4b3e04')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure
    make
    make DESTDIR=$startdir/pkg install
}

