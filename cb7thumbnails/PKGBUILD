# Maintainer: marcinfa <marcinfa@gmail.com>

pkgname=cb7thumbnails
pkgver=0.2.0
pkgrel=1
pkgdesc="A Thumbnail creator for KDE 4 that enables previewing cb7 files"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/ComicBook+7zip+Thumbnail+Plugin?content=157716"
license=('GPL3')
depends=('kdebase-workspace' 'p7zip')
makedepends=('cmake' 'automoc4')
install=$pkgname.install
source=("http://kde-apps.org/CONTENT/content-files/157716-$pkgname-$pkgver.tar.gz")
md5sums=('195d5a61c6f6b936e2326260ff7f12d6')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DQT_QMAKE_EXECUTABLE=qmake4 -DCMAKE_BUILD_TYPE=Release ..
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR=$pkgdir install
}
