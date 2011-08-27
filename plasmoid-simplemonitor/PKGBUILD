# Contributor: Viliam Pucik <viliam dot pucik at gmail dot com>

pkgname=plasmoid-simplemonitor
pkgver=0.1
pkgrel=2
pkgdesc="KDE 4 Plasma applet which displays the history of CPU usage (shown for all CPUs in the system) and used and disk cache memory"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Simple+monitor?content=84933"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('gcc' 'cmake' 'automoc4')
source=(http://www.kde-look.org/CONTENT/content-files/84933-simplemonitor.tar.gz)

build() {
  cd $startdir/src/simplemonitor
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make || return 1
  make DESTDIR=$pkgdir install
}

md5sums=('e37d206a7e45cebd6c62c717e008215d')
