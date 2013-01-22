# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=xf86-video-emgd-1.16
_pkgname=xf86-video-emgd
pkgver=1.16.3196
pkgrel=1
pkgdesc="Drivers for Poulsbo (psb) 3D acceleration"
url="http://edc.intel.com/Software/Downloads/EMGD/"
license=('custom')
arch=('i686')
depends=('libxv' 'libva' 'libxfixes' 'gcc-libs' 'expat' 'libdrm' 'libxcb' 'talloc' 'dkms-emgd-1.16')
source="http://www.fit-pc2.com/download/mint/fitpc2/maya/emgd-bin_1.16.3196.deb"
md5sums=('18e7e42d16761c70a9f49aa666585f62')


package() {
  cd "${srcdir}"
  tar xzf data.tar.gz
  mkdir -p "${pkgdir}"/usr

  cp -R usr/* "${pkgdir}"/usr/
}
