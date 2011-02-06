# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=flashqard
pkgver=0.15.0
pkgrel=2
pkgdesc="A power Qt flashcard application."
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php/FlashQard?content=94393"
license=('GPL')
depends=('hicolor-icon-theme' 'qt')
source=(http://downloads.sourceforge.net/flashqard/flashqard-$pkgver.tar.gz)

build() {

mkdir $srcdir/$pkgname-build
cd $srcdir/$pkgname-build
cmake -DCMAKE_INSTALL_PREFIX=/usr ../$pkgname-$pkgver || return 1
make || return 1
make DESTDIR=$pkgdir install || return 1

}
md5sums=('aa2c58d3b18f0ce8d2a31ece9d299647')
