# Contributor: bb <archlinux@gmx.net>
pkgname=cutecom-qt4
pkgver=0.20.0
pkgrel=1
pkgdesc="A graphical serial terminal (using Qt4)"
arch=('i686')
license=('GPL')
url="http://cutecom.sourceforge.net/"
depends=('qt')
makedepends=('cmake')
conflicts=('cutecom')
source=(http://cutecom.sourceforge.net/cutecom-$pkgver.tar.gz)
md5sums=('a42394c3a29a2dc30edab721469f5eee')

build() {
  cd $startdir/src/cutecom-$pkgver
  cmake .
  make || return 1
  mkdir -p $startdir/pkg/opt/kde/bin
  cp $startdir/src/cutecom-$pkgver/cutecom $startdir/pkg/opt/kde/bin/cutecom
  mkdir -p $startdir/pkg/opt/kde/share/applnk/Utilities/
  cp $startdir/src/cutecom-$pkgver/cutecom.desktop $startdir/pkg/opt/kde/share/applnk/Utilities/cutecom.desktop
}
