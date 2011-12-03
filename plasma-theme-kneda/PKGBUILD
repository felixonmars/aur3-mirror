# $Id$
# Contributor: Mladen Pejakovic <pejakm@gmail.com>

_tname=kneda
pkgname=plasma-theme-${_tname}
pkgver=0.6.4
pkgrel=2
arch=('any')
url="http://www.chakra-project.org"
pkgdesc='Chakra KNEDA Plasma theme'
license=('GPL')
groups=('kde' 'kdeartwork')
depends=('kdebase-runtime')
source=("http://chakra-linux.org/sources/${_tname}/${_tname/k/K}-${pkgver}.tar.gz")
md5sums=('149b1ace8fa3d2d7f981bc6841749f83')

build() {
  mkdir -p ${pkgdir}/usr/share/apps/desktoptheme
  cd ${srcdir}
  cp -R ${_tname/k/K} ${pkgdir}/usr/share/apps/desktoptheme
  chmod 755 -R ${pkgdir}/usr/share/apps/desktoptheme
  find ${pkgdir}/ -name ".directory" -type f -exec rm -fr '{}' \;
}
