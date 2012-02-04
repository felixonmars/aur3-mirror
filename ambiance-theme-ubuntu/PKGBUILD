# Maintainer: Carmine Sorrentino <carminedz@gmail.com>

pkgname=ambiance-theme-ubuntu
pkgver=0.1.6.5
pkgrel=1
pkgdesc="Ubuntu Ambiance Theme for GNOME"
arch=('i686' 'x86_64')
makedepends=('findutils' 'imagemagick')
depends=('gtk-engine-murrine-git')
url="http://www.ubuntu.org"
license=('LGPL3')
source=(https://launchpad.net/ubuntu/+archive/primary/+files/light-themes_${pkgver}.tar.gz)
md5sums=('f65612be0d3a3149cfdee50d26ddce7d')

build() {
  mkdir -p ${pkgdir}/usr/share/themes/
  cd ${srcdir}/light-themes*/
  cp -r "Ambiance" "${pkgdir}/usr/share/themes"
  cp -r "Radiance" "${pkgdir}/usr/share/themes"
}
