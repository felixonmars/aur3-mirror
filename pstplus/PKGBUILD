# Maintainer: moostik <mooostik_at_gmail.com>

pkgname=pstplus
pkgver=1.6
pkgrel=3
pkgdesc="Creates LaTeX/Pstricks code for mathematic graphics"
url='http://www.xm1math.net/pstplus/'
license=('GPL') 
arch=('i686' 'x86_64')
depends=('qt4' 'texlive-pstricks' 'ghostscript' 'poppler-qt')
optdepends=('gnuplot: for 3D graphics')
source=("http://www.xm1math.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('2db997a5e2d9003f7f010bce7f769bb1')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  export INSTALL_ROOT=${pkgdir}
  qmake-qt4 PREFIX=/usr ${pkgname}.pro
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make install

  rm ${pkgdir}/usr/share/${pkgname}/COPYING
}
