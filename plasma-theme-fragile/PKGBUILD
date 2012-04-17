# $Id$
# Contributor: Mladen Pejakovic <pejakm@gmail.com>

_tname=fragile
pkgname=plasma-theme-${_tname}
pkgver=1.5
pkgrel=1
arch=('any')
_kdeapps=125974
url="http://kde-look.org/content/show.php?content=${_kdeapps}"
pkgdesc='Glassy plasma theme'
license=('GPL')
groups=('kde' 'kdeartwork')
depends=('kdebase-runtime')
source=("http://kde-look.org/CONTENT/content-files/${_kdeapps}-${_tname/f/F}-${pkgver}.tar.gz")
md5sums=('0f94a5bc97692e4bf4269b7be2918810')

build() {
  mkdir -p ${pkgdir}/usr/share/apps/desktoptheme
  cd ${srcdir}
  cp -R ${_tname/f/F} ${pkgdir}/usr/share/apps/desktoptheme
  chmod 755 -R ${pkgdir}/usr/share/apps/desktoptheme
  find ${pkgdir}/ -name ".directory" -type f -exec rm -fr '{}' \;
}
