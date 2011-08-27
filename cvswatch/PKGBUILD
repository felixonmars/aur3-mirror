# Maintainer: TDY <tdy@gmx.com>

pkgname=cvswatch
pkgver=1.4.4
pkgrel=1
pkgdesc="A QT client for managing CVS repositories"
arch=('i686' 'x86_64')
url="http://www.phenix.bnl.gov/WWW/publish/hpereira/software/index.php?page=package&package_list=software_list_qt4&package=cvswatch-qt4&full=1"
license=('GPL')
depends=('qt')
source=(http://www.phenix.bnl.gov/WWW/publish/hpereira/software/tgz/$pkgname-qt4_$pkgver.tar.gz)
md5sums=('ac983bf4019aad435d0004d422a493f5')

build() {
  cd "$srcdir/$pkgname-qt4_$pkgver"
  ./autogen.sh --prefix=/usr --with-qt-dir=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-qt4_$pkgver"
  make DESTDIR="$pkgdir" install
}
