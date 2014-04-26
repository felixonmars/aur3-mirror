# Maintainer: TDY <tdy@gmx.com>

pkgname=taskbar
pkgver=2.4.11
pkgrel=1
pkgdesc="A transparent taskbar that collects your favorite applications and runs them in a simple click"
arch=('i686' 'x86_64')
url="http://www.phenix.bnl.gov/WWW/publish/hpereira/software/index.php?page=package&package_list=software_list_qt4&package=taskbar-qt4&full=1"
license=('GPL')
depends=('qt4')
source=(http://hugo.pereira.free.fr/software/tgz/$pkgname-$pkgver.tar.gz)
md5sums=('9c595b31dc817ceb1f643c9d2d58203c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake .\
    -DQT_QMAKE_EXECUTABLE=qmake4 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
