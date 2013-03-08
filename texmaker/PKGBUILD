# Maintainer: Maximilian Braeutigam < max - braeu at gmx.de >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: furester <xfurester@hotmail.com> 
# Contributor: Firmicus <firmicus gmx net> 
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>

pkgname=texmaker
pkgver=4.0
pkgrel=1
pkgdesc='Free cross-platform latex editor'
arch=('i686' 'x86_64')
url="http://www.xm1math.net/texmaker/index.html"
license=('GPL')
install='texmaker.install'
depends=('poppler-qt' 'ghostscript' 'qtwebkit')
optdepends=('ibus-qt: accented characters support')
source=("http://www.xm1math.net/texmaker/texmaker-${pkgver}.tar.bz2")
md5sums=('3599fd142d8d3596b7bd14724fc1888e')
sha1sums=('b64bd1f1ed7a74a3085898818714d10516591b12')

build() {
  cd texmaker-${pkgver}

  export INSTALL_ROOT=${pkgdir}

  qmake-qt4 -unix PREFIX=//usr texmaker.pro

  make
}

package() {
  cd texmaker-${pkgver}

  export INSTALL_PATH=${pkgdir}

  make install
}
