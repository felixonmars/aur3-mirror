# Maintainer: chris_L <chrislcenter dash mamoru at yahoo.com dot mx>

pkgname=mining-haze
pkgver=0.1
pkgrel=1
pkgdesc="An ncurses game, clone of classical Boulder Dash - dig in earth, collect diamonds, watch out for stones... and HAVE FUN!"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/mininghaze/"
license=('GPLv2')
depends=('ncurses')
source=("http://iweb.dl.sourceforge.net/project/mininghaze/mininghaze/0.1/mining-haze-0.1.tar.bz2")
md5sums=('0e9e30dcdc3cb27e4a8f234d825fe753')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr --datarootdir=/usr/share || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1
}
