# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Packages and sources check by namcap for consistency
pkgname=kubuntu-low-fat-settings
pkgver=11.10ubuntu3
pkgrel=1
pkgdesc="Default settings for Kubuntu Low Fat setups"
arch=('any')
url="http://packages.ubuntu.com/oneiric/kubuntu-low-fat-settings"
license=('GPL')
depends=()
source=("http://archive.ubuntu.com/ubuntu/pool/universe/k/${pkgname}/${pkgname}_${pkgver}.tar.gz")
sha512sums=('e17914911e1dce66ce382c7fd3ad84c548bae37c508ce3e11312a76fb81b6f96a122ad9e5fc941fd0a0a274d13a09969cd3c353f840843f56f19deb147fd04ce')

build() {
  msg "Nothing to build."
}

check() {
  msg "Nothing to check."
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/${pkgname}/"
  install -d "${pkgdir}/etc/X11/xinit/xinitrc.d/"
  install -m755 "etc/X11/Xsession.d/50lowfat" "${pkgdir}/etc/X11/xinit/xinitrc.d/"
  cp -r --preserve=mode,links share/ "${pkgdir}/usr/share/${pkgname}/"
}

# vim:set ts=2 sw=2 et:
