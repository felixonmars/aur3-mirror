# Maintainer: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=kbibtex-devel
_appname=kbibtex
pkgver=0.5rc2
_appver=0.4.96
pkgrel=1
pkgdesc="A BibTeX editor for KDE. Unstable version"
arch=('i686' 'x86_64')
url='http://home.gna.org/kbibtex/'
license=('GPL')
conflicts=('kbibtex')
provides=('kbibtex')
depends=('kdebase-runtime' 'poppler-qt')
makedepends=('cmake' 'automoc4')
install=${pkgname}.install
source=("http://download.gna.org/$_appname/0.5/$_appname-$_appver.tar.xz" $pkgname.install)
md5sums=('364b2a87620879e7fd81788390b7b03b'
         'dc1079cf1f785631621386f5dd0948dc')

build() {
  cd $_appname-$_appver
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd $_appname-$_appver/build
  make DESTDIR=$pkgdir install
}
