# Maintainer: Dominik Fuchs <dominik.fuchs (at) wur.nl>
# Contributor: Dylon Edwards <deltaecho@archlinux.us>

pkgname=libwms
pkgver=1.7.13
pkgrel=2

pkgdesc="Library of mechanisms to get image data from WebMapServices"
url="http://www.ossim.org"
license=('LGPL')

depends=('curl' 'expat')
makedepends=('patch')
optdepends=()

arch=('i686' 'x86_64')

source=(libwms_${pkgver}.patch
	makedefs_${pkgver}.patch)
md5sums=('aec2e52639421e3350c1511d8a64f608'
         '05c7c15f5f76fa09731739879d4a9ec3')

#  This is for version 1.7.13, not 13935,
#+ so I don't want Pacman to change the pkgver ;)
svntrunk="http://svn.osgeo.org/ossim/tags/v${pkgver//./_}"
svnmod="libwms"

build() {

  [[ ! -d ${svnmod}/.svn ]] && svn co ${svntrunk}/${svnmod} 
  cd ${svnmod}

  patch -Np1 -i ../libwms_${pkgver}.patch 
  patch -Np1 Make/makedefs -i ../makedefs_${pkgver}.patch

  make || return 1
  make INST_LOCATION=$startdir/pkg/usr install

  rm -rf ${pkgdir}/usr/share/libwms/src/Make
}
