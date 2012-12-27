# $Id$
# Maintainer: Michal Donat <michal.donat@atlas.cz>

pkgname=kdemultimedia-kmix-patched
pkgver=4.9.4
pkgrel=1
pkgdesc="KDE volume control program - patched flickering systray"
url='http://kde.org/applications/multimedia/kmix/'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL')
groups=('kde' 'kdemultimedia')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4')
provides=('kdemultimedia-kmix')
conflicts=('kdemultimedia-kmix')

install="${pkgname}.install"
source=("http://download.kde.org/stable/${pkgver}/src/kmix-${pkgver}.tar.xz" 'patch01.diff' 'patch02.diff' 'patch03.diff')
sha1sums=('812087a8acfdbe676af422f2742f8c4fee91a835'
          '34099129fc8e662f40172c7494df5ec0acbe774d'
          '583352a986044eb00c73078cdbe62e50f65d64cc'
          '1563b76d48d9290fdfc84f99d65045ff56ea0013')

build() {
  cd "${srcdir}"

# Following patches fixes bug 309045.
# See https://bugs.kde.org/show_bug.cgi?id=309045
# This bug will be fixed in KDE 4.10

  patch -p1 < "$srcdir/patch01.diff"
  patch -p1 < "$srcdir/patch02.diff"
  patch -p1 < "$srcdir/patch03.diff"
  [ -d build ] && rm -r build
  mkdir build && cd build
  cmake ../kmix-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
}
