# Contributor: Leandro Chescotta <leandro.chescotta@gmail.com>
pkgname=cxmame
pkgver=0.4.2
pkgrel=1
pkgdesc="CXmame is a simple console based frontend for xmame, written in C using the ncurses library"
arch=('i686' 'x86_64')
url="http://yeeking.net/cxmame/"
license=('GPL')
groups=()
depends=('ncurses')
makedepends=()
provides=('cxmame')
conflicts=()
replaces=()
backup=()
options=()
install=cxmame.install
source=(http://yeeking.net/cxmame/files/$pkgname-$pkgver.src.tar.bz2)
noextract=()
md5sums=('b8242450d947db73e35bcb602a71cba7') #generate with 'makepkg -g'

build() {
    cd "$srcdir/$pkgname-$pkgver"
    # correct location of install in the Makefile
    sed -i 's/\/usr\/bin\/install/\/bin\/install/' Makefile
    # create intended target directory
    install -m755 -d $pkgdir/usr/bin

    make || return 1
    make INSTALL_DIR=$pkgdir/usr/bin install || return 1
}
