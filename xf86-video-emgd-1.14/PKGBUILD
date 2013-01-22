# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=xf86-video-emgd-1.14
_pkgname=xf86-video-emgd
_modpackage=xorg-emgd
pkgver=1.14.0.2443
_pkgver=pvr1.5.15.3226
_ubustring=0ubuntu4~ppa1
pkgrel=1
pkgdesc="Drivers for Poulsbo (psb) 3D acceleration"
url="http://edc.intel.com/Software/Downloads/EMGD/"
license=('custom')
arch=('i686')
depends=('libxv' 'libva' 'libxfixes' 'gcc-libs' 'expat' 'libdrm' 'libxcb' 'talloc' 'dkms-emgd-1.14')
source="http://ppa.launchpad.net/jools/emgd-xorg1.9/ubuntu/pool/main/x/xorg-emgd/${_modpackage}_${pkgver}+${_pkgver}-${_ubustring}.tar.gz"
md5sums=('489e2744d13cab15ad1e03ef8e177f79')


package() {
  cd "${srcdir}"/"${_modpackage}"-"${pkgver}"+"${_pkgver}"
  mkdir -p "${pkgdir}"/usr
  mkdir -p "${pkgdir}"/etc
  mkdir -p "${pkgdir}"/usr/share/licenses/"${_pkgname}"

  cp -R usr/* "${pkgdir}"/usr/
  install -D etc/powervr.ini  "${pkgdir}"/etc/powervrd.ini
  install -D debian/copyright "${pkgdir}"/usr/share/licenses/"${_pkgname}"/copyright
}
