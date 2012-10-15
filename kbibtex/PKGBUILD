# Contributor: Antonio Rojas <nqn1976 @ gmail.com>
# Contributor: cmorlok <christianmorlok@web.de> 

pkgname=kbibtex
pkgver=0.4.1
pkgrel=1
pkgdesc="A BibTeX editor for KDE"
arch=('i686' 'x86_64')
url='http://home.gna.org/kbibtex/'
license=('GPL')
depends=('kdebase-runtime' 'poppler-qt')
makedepends=('cmake' 'automoc4')
install=${pkgname}.install
source=("http://download.gna.org/$pkgname/0.4/$pkgname-$pkgver.tar.bz2" $pkgname.install)
md5sums=('657eda1da48198a3c336ff268ce46d6f'
         'dc1079cf1f785631621386f5dd0948dc')

build() {
  cd $pkgname-$pkgver
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR=$pkgdir install
}
