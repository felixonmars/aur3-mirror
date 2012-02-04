#Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
#Contributor: Noch noch@noch.xooit.net

pkgname=kdestyle-lipstik1
pkgver=1.3
pkgrel=1
pkgdesc="A purified Plastik style with many options to tune your desktop look"
url="http://www.kde-look.org/content/show.php?content=18223"
license=""
depends=('qt')
makedepends=('kdelibs')
install=
source=(http://www.kde-look.org/content/files/18223-lipstik-$pkgver.tar.bz2)
md5sums=('c5ac975491cf1d7b7b1ae0ceebffa25f')

build() {
  cd $startdir/src/lipstik-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make prefix=$startdir/pkg/opt/kde install
}
