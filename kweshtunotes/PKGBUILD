# Contributor: Neophytos Kolokotronis <tetris4@gmail.com>

pkgname=kweshtunotes
pkgver=0.3.2
pkgrel=2
pkgdesc="A note-taking application, just like BasKet Note Pads."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/KWeshTuNotes?content=116403"
license=('GPL')
depends=('qt4' 'kdebase-runtime' 'kdelibs')
makedepends=('automoc4' 'cmake' 'p7zip')
source=(http://weshtunotes.googlecode.com/files/$pkgname-src-$pkgver-r270.7z)
md5sums=('2bf72e165b787ada2f6b784d5777bc44')

build() {
  #7z x $pkgname-src-$pkgver-r270.7z
  cd $pkgname-$pkgver
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake-qt4 ..
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR=$pkgdir install
}
