# Contributor: Jakub Schmidtke <sjakub-at-gmail.com>

pkgname=kmuddy
pkgver=1.0.1
pkgrel=5
pkgdesc="MUD client for KDE desktop environment."
arch=('i686' 'x86_64')
url="http://www.kmuddy.com"
license=('GPL')
install=${pkgname}.install
depends=('libmxp>=0.2.4' 'kdelibs')
makedepends=('automoc4' 'cmake')
source=("http://www.kmuddy.com/releases/stable/${pkgname}-${pkgver}.tar.gz" "dtd.patch")
md5sums=('b98a1753c728134c80fd253e454e41ce'
         '920e641d9ff8e1ed68c29106d7d9bd6f')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  sed -i 's|setColor(QColor::QColor(|setColor(QColor(|' plugins/mapper/filefilters/cmapfilefilterkmudone.cpp
  patch -Np1 -i ${srcdir}/dtd.patch || return 1
  echo 'install( FILES kmuddy.desktop DESTINATION ${XDG_APPS_INSTALL_DIR} )' >> kmuddy/CMakeLists.txt
  rm -rf ${srcdir}/build
  mkdir ${srcdir}/build
  cd ${srcdir}/build
  cmake ../${pkgname}-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
  make DESTDIR=${pkgdir} install
}
