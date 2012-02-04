# Contributor: Timur Antipin < mooxtim (at) yandex.ru >
pkgname=rdko
pkgver=0.3.1.76
pkgrel=4
pkgdesc="A file corruption detection and correction program"
arch=('i686' 'x86_64')
url="http://rdko.sourceforge.net/"
license=('GPL2')
makedepends=('make')
source=("http://downloads.sourceforge.net/project/rdko/RemenDeKO/RemenDeKO%200.3/RemenDeKO-0.3.0.tar.bz2")
md5sums=('5fcd48217e29406785533b57537198e6')

build() {
  cd $srcdir/RemenDeKO
  make rdko || return 1
  install -D $srcdir/RemenDeKO/rdko $pkgdir/usr/bin/rdko
}
