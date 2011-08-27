#Contributor: allencch <allencch at hotmail dot com>
#Contributor: joyfulgirl <joyfulgirl (at) archlinux.us>
#Contributor Paolo Fagni <paolo.fagni@gmail.com>
# Contributor: hm_b <holger (at) music-nerds.net>
pkgname=clam-annotator
pkgver=0.5.0
pkgrel=1
pkgdesc="Visualize, check & modify music information extracted from audio."
arch=('i686' 'x86_64')
url="http://clam-project.org/"
license=('GPL')
depends=('clam>=1.3.0')
source=(http://clam-project.org/download/src/Annotator-${pkgver}.tar.gz)
md5sums=('c87b7df7d429dffd5967b2001efdbaaf')

build() {
  install -d ${pkgdir}/usr
  
  # use qt4
  declare -x QTDIR="/usr"
  # use xerces-c v2
  export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/xerces-c-2/lib"

  cd ${srcdir}/Annotator-${pkgver}/vmqt
  scons clam_prefix=/usr || return 1

  cd ${srcdir}/Annotator-${pkgver}
  scons clam_prefix=/usr prefix=${pkgdir}/usr || return 1
  scons install
}
