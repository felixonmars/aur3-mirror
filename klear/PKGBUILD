# Contributor: AndyRTR <andreas.radke@freenet.de>
# Maintainer: Isenmann Daniel <daniel.isenmann AT gmx.de>
pkgname=klear
pkgver=0.6.1
pkgrel=1
pkgdesc="KDE desktop applikation for watching DVB-S/T/C"
url="http://klear.org"
license="GPL"
arch=('i686' 'x86_64')
depends=(kdelibs xine-lib)
makedepends=(scons)
source=(http://klear.org/sources/$pkgname-$pkgver.tar.gz)
md5sums=('9ca6f2ac404ecba0195b1449cc76c7c6')

build() {
  cd $startdir/src/$pkgname-$pkgver
  scons prefix=$startdir/pkg/opt/kde/
  scons prefix=$startdir/pkg/opt/kde/ install  || return 1
}
