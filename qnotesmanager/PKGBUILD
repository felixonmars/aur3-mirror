# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=qnotesmanager
pkgver=0.9.6
pkgrel=1
pkgdesc="Simple note-taking software written in Qt4."
arch=('i686' 'x86_64')
url="https://github.com/WalterSullivan/qNotesManager/wiki"
license=('GPL3')
depends=('openssl' 'qca-ossl')
source=($pkgname-$pkgver.tar.gz::https://github.com/WalterSullivan/qNotesManager/archive/$pkgver.tar.gz
        $pkgname.desktop)
md5sums=('ca90ada3e6a62c240663ecb2d00d2fc5'
         '9ce2b882df73b37c7e55ed706424be62')

prepare() { 
  cd $srcdir/qNotesManager-$pkgver 
  qmake-qt4
  
  # Fix QtCrypto include path
  sed -i 's|qt4/QtGui|qt4/QtGui -I/usr/include/QtCrypto|' Makefile
}

build() {
  cd $srcdir/qNotesManager-$pkgver
  make
}

package() {
  cd $srcdir/qNotesManager-$pkgver
  install -Dm755 build/release/$pkgname $pkgdir/usr/bin/$pkgname

  # Desktop icon
  install -Dm644 icons/book-brown.png  $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
