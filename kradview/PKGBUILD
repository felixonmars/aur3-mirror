# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=kradview  
pkgver=1.1.0
pkgrel=8
pkgdesc="The free DICOM viewer for Linux"
url="http://www.orcero.org/irbis/kradview/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdelibs3' 'libart-lgpl' 'qt3' 'acl')
source=(http://www.orcero.org/irbis/$pkgname/$pkgname-$pkgver.tgz)
md5sums=('b2c0f4081a74e86e8fee0e54a2364258')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --without-arts --with-qt-dir=/opt/qt || return
  make  || return 1
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install || return 1
  install -Dm755 $pkgdir/usr/share/applnk/Utilities/kradview.desktop \
    $pkgdir/usr/share/applications/kradview.desktop || return 1
  rm -rf $pkgdir/usr/share/applnk || return 1
  rm -rf $pkgdir/usr/share/apps || return 1
  rm $pkgdir/usr/share/doc/HTML/en/kradview/common  || return 1
}