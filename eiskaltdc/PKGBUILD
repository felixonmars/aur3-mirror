# Contributor: dhampire <dhamp@ya.ru>
pkgname=eiskaltdc
pkgver=1.0.41
pkgrel=1
pkgdesc="Qt4-based GUI-frontend for dclib(like Valknut) with segmented downloading"
license=('GPL')
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/eiskaltdc/"
depends=('qt>=4.5' 'openssl' 'bzip2' 'libxml2' 'zlib')
makedepends=('gcc' 'pkgconfig' 'cmake')
conflicts=('eiskaltdc-svn' 'eiskaltdc')
provides=('eiskaltdc')
source=(http://downloads.sourceforge.net/project/eiskaltdc/eiskaltdc/$pkgname-$pkgver.tar.bz2)
md5sums=('5a0c2d8c5ab8718a0915d42c64644291')
sha1sums=('15d254d777ad627b63a909eae08081e97d5bf03c')

build() {
  cd $srcdir
  rm -rf $srcdir/$pkgname-build
  cp -r $srcdir/$pkgname-$pkgver $srcdir/$pkgname-build
  cd $pkgname-build
  cmake . -DCMAKE_INSTALL_PREFIX=/usr || return 1
  make DESTDIR=$pkgdir install || return 1
  rm -rf $srcdir/$pkgname-build
}
