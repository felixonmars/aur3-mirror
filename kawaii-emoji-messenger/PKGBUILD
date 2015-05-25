# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=kawaii-emoji-messenger
pkgver=0.3.0
pkgrel=2
pkgdesc="Multiplatform Facebook client based on the idea of bringing emoji on desktop."
arch=('i686' 'x86_64')
url="http://kawaii-emoji-messenger.sourceforge.net/"
license=('GPL3')
depends=('qtwebkit')
makedepends=('cmake')
source=(http://sf.net/projects/$pkgname/files/Kawaii%20Emoji%20Messenger/0.3/$pkgname-$pkgver-beta.tar.bz2)
md5sums=('faf19496e64c9d80a4e0af0084b4845c')

prepare() {
  cd $srcdir/$pkgname-$pkgver-beta

  # Add Qtgui and Qtcore for linking 
  sed -i '8i SET(QT_USE_QTGUI TRUE) ' CMakeLists.txt
  sed -i '9i SET(QT_USE_QTCORE TRUE) ' CMakeLists.txt

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
}

build() {
  cd $srcdir/$pkgname-$pkgver-beta
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver-beta
  make DESTDIR=$pkgdir install
}
