# Contributor: Philipp Giebel <arch@ambience-design.net
pkgname=tuxsaver
pkgver=1.0
pkgrel=1
pkgdesc="Tropical TuxSaver KDE Screensaver"
depends=('kdelibs' 'mesa')
source=("http://users.telenet.be/muylkens/$pkgname-$pkgver.tar.gz")
url="http://www.kde-look.org/content/show.php?content=4773"
license="GPL"
md5sums=('178643486e4f2687cba0ce7d6a7d2b32')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde --disable-debug
  make || return 1
  make prefix=$startdir/pkg/opt/kde install
}
