# $Id$
# Maintainer: Ilya87 <yast4ik@yahoo.com>
pkgname=qsnapshot-git
pkgver=c256b3b
pkgrel=1
pkgdesc="ksnapshot clone using qt5."
arch=('i686' 'x86_64')
url="https://github.com/dridk/qsnapshot"
license=('GPL3')
makedepends=('')
depends=('qt5-base')
provides=('qsnapshot')
conflicts=('qsnapshot')
source=("git+https://github.com/dridk/qsnapshot.git" 'qsnapshot.desktop')
sha1sums=('SKIP' '9f9180fc5e6aeaea4829f3fb7c2b8544fdf6392d')

pkgver() {
  cd qsnapshot
  git describe --always | sed 's|-|.|g'
}

build() {
  cd qsnapshot
  qmake-qt5
  make
}

package() {
  cd qsnapshot
  install -D -m755 cutesnapshot ${pkgdir}/usr/bin/qsnapshot
  mkdir -p ${pkgdir}/usr/share/{pixmaps,applications}
  cp icons/slr_camera.png ${pkgdir}/usr/share/pixmaps/qsnapshot.png
  cp ../qsnapshot.desktop ${pkgdir}/usr/share/applications
}