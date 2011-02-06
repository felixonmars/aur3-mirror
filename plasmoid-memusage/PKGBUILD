# Contributor: Viliam Pucik <viliam dot pucik at gmail dot com>

pkgname=plasmoid-memusage
pkgver=0.3.3
pkgrel=1
pkgdesc="KDE 4 Plasma applet which displays RAM and swap usage"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/memusage?content=86630"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('gcc' 'cmake' 'automoc4')
source=(http://kde-look.org/CONTENT/content-files/86630-memusage-$pkgver.tar.gz)
md5sums=('d919e2a9157753ba44b6d040e4dd652d')

build() {
  cd $startdir/src/memusage
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make || return 1
  make DESTDIR=$pkgdir install
}
