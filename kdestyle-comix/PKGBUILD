#Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=kdestyle-comix
pkgver=1.3.8
pkgrel=1
pkgdesc="Another flat style for KDE"
url="http://www.kde-look.org/content/show.php?content=16028"
license=""
depends=('qt')
makedepends=('kdelibs')
source=(http://www.kde-look.org/content/files/16028-comix-$pkgver.tar.bz2)
md5sums=('f3a9ee8b8b6f69a8c6307905cefc306e')

build() {
  cd $startdir/src/comix-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make prefix=$startdir/pkg/opt/kde install
}
md5sums=('2da45aa6c4cb1c51a9414e9fe39c69fa')
