# Maintainer: Michael Düll <mail@akurei.me> PGP-Key: AAAEE882

pkgname=kdeicons-ossigeno2
_dirname=MIB-Ossigeno-Icons
pkgver=2.0
pkgrel=5
pkgdesc="This is the (old) version 2.0 of the icon theme"
arch=('any')
depends=()
replaces=()
conflicts=()
url="http://kde-look.org/content/show.php/MIB+Ossigeno?content=126122"
license=('LGPL')
source=(http://mib.pianetalinux.org/MIB/2010.1/others/projects/MIB-Ossigeno/${_dirname}-${pkgver}.tar.gz)
md5sums=('2dc9edebbf728c14dee351bf82c692b8')

build() {
  cd ${srcdir}
  find ${srcdir} -iname ".directory" -exec rm {} \;
  install -d ${pkgdir}/usr/share/icons/
  cp -R ${_dirname} ${pkgdir}/usr/share/icons/${pkgname} || return 1
}
