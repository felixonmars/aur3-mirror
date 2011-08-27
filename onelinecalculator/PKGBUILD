# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
pkgname=onelinecalculator
pkgver=0.3
pkgrel=2
pkgdesc="A lineedit KDE plasmoid calculator."
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/One-Line+Calculator?content=89524"
license=('GPL2')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
source=(http://www.kde-look.org/CONTENT/content-files/89524-onlinecalc-$pkgver.tar.gz)

build() {

mkdir $srcdir/onlinecalc/build
cd $srcdir/onlinecalc/build
cmake -DCMAKE_INSTALL_PREFIX=/usr ../ || return 1
make || return 1
make DESTDIR=$pkgdir install || return 1

}
md5sums=('da67dbc41d7bd5b64954a1732adfd2e1')
