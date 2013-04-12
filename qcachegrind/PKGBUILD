# Maintainer: Ivan Sichmann Freitas <ivansichfreitas@gmail.com>

pkgname=qcachegrind
_pkgname=kcachegrind
pkgver=0.7.4
pkgrel=1
pkgdesc="Visualization of Performance Profiling Data (Qt version)"
arch=('i686' 'x86_64')
url="http://kcachegrind.sourceforge.net"
license=('GPL')
groups=()
depends=('qt4')
makedepends=('pkg-config' 'qt4')
optdepends=('graphviz')
provides=('qcachegrind' 'kdesdk-kcachegrind')
conflicts=('qcachegrind-svn')
source=(http://kcachegrind.sourceforge.net/$_pkgname-$pkgver.tar.gz)
md5sums=('a0be465c0f4acfa08bedafb3963a3193')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir build && cd build
  qmake-qt4 ../qcg.pro
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/build"
  install -D -m 755 -p qcachegrind/qcachegrind "$pkgdir/usr/bin/qcachegrind"
  install -D -m 755 -p cgview/cgview "$pkgdir/usr/bin/cgview"
}
