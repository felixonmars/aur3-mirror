#Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=kdestyle-alloy
pkgver=0.5.3
pkgrel=1
pkgdesc="A style based on the Java Alloy Look & Feel"
url="http://www.kde-look.org/content/show.php?content=10605"
license=""
depends=('qt')
makedepends=('kdelibs')
install=
source=(http://www.kde-look.org/content/files/10605-alloy-$pkgver.tar.bz2)
md5sums=('4c84f744ba0eeda89436e1c671e18c85')

build() {
  cd $startdir/src/alloy-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make prefix=$startdir/pkg/opt/kde install
}
