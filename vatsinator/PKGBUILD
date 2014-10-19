# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=vatsinator
pkgver=0.2.1
pkgrel=2
pkgdesc="An open-source Vatsim monitor."
arch=('i686' 'x86_64')
url="http://vatsinator.eu.org/"
license=('GPL3')
depends=('qt5-base')
makedepends=('cmake')
install=$pkgname.install
source=(http://vatsinator.eu.org/downloads/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('58c94cd7952c26bcebcb7f4956628d63')

prepare() {
  cd $srcdir 
  cmake -DQT_QMAKE_EXECUTABLE=qmake-qt5 -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd $srcdir
  make DESTDIR=$pkgdir install
}
