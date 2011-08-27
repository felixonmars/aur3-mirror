# Mainteiner: Simone Tobia <simone.tobia@gmail.com>

pkgname=kdeplasma-applets-tictactoefromhell
pkgver=3.2
pkgrel=1
pkgdesc="A plasmoid for KDE4 featuring the TicTacToe game with animated graphics simulating hand drawing and many game variants."
url="http://kde-look.org/content/show.php?content=123968"
arch=('i686')
license=('GPL2')
depends=('kdebase-workspace')
source=(http://downloads.sourceforge.net/project/tttfh/tttfh/$pkgver/tttfh-$pkgver-plasmoid-sources.tar.gz)
makedepends=('cmake' 'automoc4')
md5sums=('cdb4ba7c2c5dd2a9743b0b1e0799c751')


build() {
    cd $srcdir/tttfh-$pkgver-plasmoid-sources
    cmake -DCMAKE_INSTALL_PREFIX=/usr . || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1
}
