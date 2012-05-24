# Maintainer: Vit <vitruss@gmail.com>

pkgname=xcrysden-bin
pkgver=1.5.53
pkgrel=1
pkgdesc="crystalline and molecular structure visualisation program (shared binary x86_64 version)"
arch=('x86_64')
url="http://www.xcrysden.org/"
license=('GPLv2')

source=(http://www.xcrysden.org/download/xcrysden-${pkgver}-linux_${CARCH}-shared.tar.gz
xcrysden.sh)
depends=('libmeschach' 'tk')
md5sums=('6f49c12565c7e24c144969bb744ed66e'
	 '9e6a853d258a7ee9254a24bf49b3e29c')

build() {
  mkdir -p ${pkgdir}/usr/lib
  mkdir -p ${pkgdir}/opt
  ln -s /usr/lib/libtk8.5.so ${pkgdir}/usr/lib/libtk8.5.so.0
  ln -s /usr/lib/libtcl8.5.so ${pkgdir}/usr/lib/libtcl8.5.so.0
  cp -r ${srcdir}/xcrysden-${pkgver}-bin-shared ${pkgdir}/opt
  install -D xcrysden.sh ${pkgdir}/etc/profile.d/xcrysden.sh
}

