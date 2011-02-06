#Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=kdestyle-activeheart
pkgver=1.2.1
pkgrel=1
pkgdesc="A harmony of sharpness and softness based on Keramik"
url="http://www.kde-look.org/content/show.php?content=11384"
license=""
depends=('qt')
makedepends=('kdelibs')
install=
source=(http://www.kde-look.org/content/files/11384-activeheart-$pkgver.tar.bz2)
md5sums=('80421708a5cfe26d75819bf618194e16')

build() {
  cd $startdir/src/activeheart-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make prefix=$startdir/pkg/opt/kde install
}
