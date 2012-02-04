# Contributor: Lukasz Fidosz <virhilo@gmail.com>
pkgname=php-qt
pkgver=0.1
pkgrel=2
pkgdesc="An extension for PHP5 that aims to write software with the Qt Toolkit."
arch=(i686 x86_64)
license="GPL"
url="http://www.php-qt.org"
depends=('qt4' 'php')
source=("http://download.berlios.de/php-qt/$pkgname-$pkgver.tar.gz")
md5sums=('18325d4c66c85114f8166c0376cd1a82')

build() {
  cd $startdir/src/php_qt
	cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE="/opt/qt4/bin/qmake"
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}