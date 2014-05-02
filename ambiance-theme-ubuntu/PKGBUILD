# Maintainer: Zavon AJ <zavonaj.linux@gmail.com>

pkgname=ambiance-theme-ubuntu
pkgver=0.1.93
pkgrel=1
pkgdesc="Ubuntu Ambiance Theme for GNOME"
arch=('i686' 'x86_64')
makedepends=('findutils' 'imagemagick')
depends=('gtk-engine-murrine')
url="https://launchpad.net/ubuntu/+source/light-themes"
license=('LGPL3')
source=(https://launchpad.net/ubuntu/+archive/primary/+files/light-themes_${pkgver}.tar.gz)
md5sums=('57baa4b1ab33288e2f31454fe39be25c')

build() {
  mkdir -p ${pkgdir}/usr/share/themes/
  cd ${srcdir}/light-themes*/
  cp -r "Ambiance" "${pkgdir}/usr/share/themes"
  cp -r "Radiance" "${pkgdir}/usr/share/themes"
}
