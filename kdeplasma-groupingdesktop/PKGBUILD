# Maintainer: Jan <jan@next-game.de>
pkgname=kdeplasma-groupingdesktop
pkgver=0.2.1
pkgrel=1
pkgdesc="An activity containment for KDE that adds to the desktop the ability to group widgets inside frames in various arrangements"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/?content=116926"
license=('GPL')
depends=('kdelibs>=4.6' 'kdebase-workspace>=4.6')
makedepends=('automoc4' 'cmake')
source=(http://kde-look.org/CONTENT/content-files/116926-groupingdesktop-$pkgver.tar.bz2)
md5sums=('c902b4a11e2a0f39c4ba140f6b92f59d')

build() {
  cd $srcdir/groupingdesktop
  mkdir build
  cd build
  cmake ${srcdir}/groupingdesktop -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}