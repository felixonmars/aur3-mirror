# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=qgtalk
pkgver=0.5.1
pkgrel=1
pkgdesc="A GTalk client for Linux using Qt4 and libgloox."
arch=('i686' 'x86_64')
url="https://code.google.com/p/qgtalk/"
license=('GPL3')
depends=('crypto++' 'gloox' 'qt4')
source=(https://qgtalk.googlecode.com/files/qGTalk_en-$pkgver.tar.gz)
md5sums=('31546cd6dc6bdea6514ae1fbac8d5ceb')

prepare() {
  cd $srcdir/qGTalk_en-$pkgver 
  qmake-qt4  
}

build() {
  cd $srcdir/qGTalk_en-$pkgver
  make QGTALK_PATH=/usr
}

package() {
  cd $srcdir/qGTalk_en-$pkgver
  make INSTALL_ROOT=$pkgdir install
}
