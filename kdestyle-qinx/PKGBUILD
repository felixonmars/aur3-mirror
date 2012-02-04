#Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=kdestyle-qinx
pkgver=1.4
pkgrel=1
pkgdesc="A style inspired by the QNX Photon desktop"
url="http://www.kde-look.org/content/show.php?content=2306"
license=""
depends=('qt')
makedepends=('kdelibs')
install=
source=(http://www.kde-look.org/content/files/2306-qinx-$pkgver.tar.bz2)
md5sums=('316956de0067e3560e89ac02a7e863b8')

build() {
  cd $startdir/src/qinx-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make prefix=$startdir/pkg/opt/kde install
}
