# Contributor: Oto Magaldadze <omagaldadze (_at) yahoo.com>
# Maintainer: Oto Magaldadze <omagaldadze (_at) yahoo.com>
pkgname=quiviewer
pkgver=0.1.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="QT Designer (.ui) file viewer"
url="http://www.qtcentre.org/threads/4814-QUiViewer-standalone-application-for-viewing-Qt4-UI-files"
license=('GPL')
depends=('qt4')
source=(http://www.braincorps.caucasus.net/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('fbf48eb7473c272a68f1976377b0ab0b')

build() {
  cd "$srcdir/$pkgname"
  
  qmake-qt4 VERBOSE=1
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 quiviewer "$pkgdir/usr/bin/quiviewer"
  #make install INSTALL_ROOT="$pkgdir"
}

