# Contributor: Federico Chiacchiaretta <federico.chia at gmail.com>
pkgname=aeterean-a
pkgver=0.1
pkgrel=1
pkgdesc="An automatic image downloader"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/aeterean-a"
license=('GPL')
depends=('qt')
makedepends=('cmake')
source=(http://downloads.sourceforge.net/project/aeterean-a/Aeterean-a/Aeterean-a_Linux-source/${pkgver}/${pkgname}_${pkgver}.tar.bz2
	aeterean-a.desktop.patch)

build() {
  cd $srcdir/${pkgname}_${pkgver}

  # apply patch for missing icon in menu
  patch -Np0 -i ${srcdir}/aeterean-a.desktop.patch || return 1

  mkdir build
  cd build

  cmake ../ -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
}

package() {
  cd $srcdir/${pkgname}_${pkgver}/build
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
md5sums=('6bc23f02382cb9505f3daa58d577ac9c'
         'a48fc9fde1e7fb41ce7ee3f35e2cb874')
