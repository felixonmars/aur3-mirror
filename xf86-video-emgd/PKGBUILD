# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=xf86-video-emgd
_modpackage=xorg-emgd
pkgver=1.10.0.2209
_pkgver=pvr1.5.15.3226
_ubustring=0ubuntu1~ppa5
pkgrel=1
pkgdesc="Drivers for Poulsbo (psb) 3D acceleration"
url="http://edc.intel.com/Software/Downloads/EMGD/"
license=('custom')
arch=('i686')
depends=('libxv' 'libva' 'libxfixes' 'gcc-libs' 'expat' 'libdrm' 'libxcb' 'talloc' 'dkms-emgd')
source="https://launchpad.net/~gma500/+archive/emgd110/+files/${_modpackage}_${pkgver}+${_pkgver}-${_ubustring}.tar.gz"
md5sums=('884249ff6244aa81b102af95e1364a2d')


package() {
  cd "${srcdir}"/"${_modpackage}"-"${pkgver}"+"${_pkgver}"
  mkdir -p "${pkgdir}"/usr/lib
  mkdir -p "${pkgdir}"/etc
  mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"

  cp -R lib/* "${pkgdir}"/usr/lib/
  install -D dri/emgd_drv_video.so "${pkgdir}"/usr/lib/dri/emgd_drv_video.so
  install -D dri/emgd_dri.so "${pkgdir}"/usr/lib/xorg/modules/dri/emgd_dri.so
  install -D drivers/emgd_drv.so "${pkgdir}"/usr/lib/xorg/modules/drivers/emgd_drv.so
  install -D etc/powervr.ini  "${pkgdir}"/etc/powervrd.ini
  install -D man/emgd.4.gz  "${pkgdir}"/usr/share/man/man4/emgd.4.gz
  install -D debian/copyright "${pkgdir}"/usr/share/licenses/"${pkgname}"/copyright
}





