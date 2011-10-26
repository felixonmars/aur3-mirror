# Maintainer: Gilrain   pierre buard+AUR at gmail com

pkgname=plasmoid-icontasks
pkgver=0.8.1
pkgrel=1
pkgdesc="Icon Tasks is a modified version of KDE 4.7 taskbar applet and taskmanager library."
arch=('any')
url="http://kde-apps.org/content/show.php/Icon+Tasks?content=144808"
license=('GPL')
depends=('kdebase-workspace<4.8')
makedepends=('cmake' 'automoc4')
source=(http://www.kde-apps.org/CONTENT/content-files/144808-plasma-icontasks-$pkgver.tar.bz2)
md5sums=('f6f7c9c6caffbb848ce25e5b4cd4b026')

build() {
  cd $srcdir/plasma-icontasks-$pkgver/
  mkdir -p build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd $srcdir/plasma-icontasks-$pkgver/build/
  make DESTDIR=$pkgdir install
}