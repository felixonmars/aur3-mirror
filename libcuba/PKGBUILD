# Maintainer: Sandro Vitenti <sandro at isoftware dot com dot br>

pkgname=libcuba
pkgver=4.2
pkgrel=1
pkgdesc="a library for multidimensional numerical integration"
arch=('i686' 'x86_64')
url="http://www.feynarts.de/cuba/"
license=('LGPL')
depends=('qt4')
makedepends=('gcc')
#optdepends=()
options=(staticlibs)
backup=()
source=("http://www.feynarts.de/cuba/Cuba-$pkgver.tar.gz")
md5sums=('b69a3a96224c13c0d538b14ebb490176')

build() {
  cd "$srcdir/Cuba-$pkgver"
  sed -e "s/qmake/qmake-qt4/g" -i makefile.in
  CFLAGS='-O2 -fPIC' ./configure --prefix=/usr --datadir=/usr/share/doc/"$pkgname-$pkgver"
}

package() {
  cd "$srcdir/Cuba-$pkgver"
  make install DESTDIR="$pkgdir"
}
