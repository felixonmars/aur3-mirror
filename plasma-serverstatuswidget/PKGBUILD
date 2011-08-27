# Contributor: Lucio Zara <pennega@gmail.com>

pkgname=plasma-serverstatuswidget
_oname=serverstatuswidget
pkgver=1.5.1
pkgrel=1
pkgdesc="This widget lets you monitor one or more servers via pings or TCP connects in a configurable interval"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/Server+Status+Widget?content=101336"
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('')
source=(http://code.bitfehler.net/serverstatuswidget/release/$_oname-$pkgver.tar.bz2)
license=('GPL')
md5sums=('2a33c714238edbbd9c4771b973b2d360')

build() {

  cd $srcdir/$_oname-$pkgver
  mkdir build
  cd build

  cmake ../ -DCMAKE_INSTALL_PREFIX='/usr' ..

  make || return 1
  make DESTDIR=$pkgdir install
}
