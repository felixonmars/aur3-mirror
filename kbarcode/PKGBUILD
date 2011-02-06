# Maintainer: Andrej Gelenberg <andrej.gelenberg@udo.edu>

pkgname=kbarcode
pkgver=2.0.7
pkgrel=2
pkgdesc="Barcode printer"
arch=('i686' 'x86_64')
url="http://www.kbarcode.net/"
license=('GPL')
depends=('kdelibs3' 'qt3' 'gcc' 'barcode')
makedepends=('pkgconfig' 'perlxml' 'unsermake')
source=(http://prdownloads.sourceforge.net/kbarcode/$pkgname-$pkgver.tar.gz)
md5sums=('a0696812ce5076dfc3ac250f14a20edf')

build() {
  cd $startdir/src/kbarcode-$pkgver
  ./configure --prefix=/opt/kde --without-arts --with-qt-dir=/opt/qt
  make || return 1
  make DESTDIR=$startdir/pkg install
}
