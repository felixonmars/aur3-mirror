# Contributor: Dan Vratil <dan@progdan.cz>

pkgname=kdeplasma-applets-idos-search
pkgver=0.1
pkgrel=1
pkgdesc="A simple applet with DataEngine for easy search on IDOS.cz"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php?content=117951"
license=('GPL3')
depends=('kdelibs' 'qt')
source=('http://kde-look.org/CONTENT/content-files/117951-idos-search.tar.gz')
replaces=('plasma-idos-search')

build() {
  cd ${srcdir}/idos-search

  mkdir build
  cd build

  cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/idos-search/build
  make DESTDIR=${pkgdir} install
}

md5sums=('3523888c3108d71a67f37d8a61bbd272')
