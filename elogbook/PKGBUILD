# Maintainer: TDY <tdy@gmx.com>

pkgname=elogbook
pkgver=1.9.2
pkgrel=2
pkgdesc="An electronic logbook for daily information (to-do lists, phone numbers, etc.) on a post-it basis"
arch=('i686' 'x86_64')
url="http://www.phenix.bnl.gov/WWW/publish/hpereira/software/index.php?page=package&package_list=software_list_qt4&package=elogbook-qt4&full=1"
license=('GPL')
depends=('aspell' 'qt' 'cmake' 'make')
source=(http://www.phenix.bnl.gov/WWW/publish/hpereira/software/tgz/$pkgname-$pkgver.tar.gz)
md5sums=('652e0719984f1850d3824cc562a21955')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake .
  make
  make install
}
