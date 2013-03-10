# Maintainer: localizator <localizator@ukr.net>
pkgname=g3-pro-theme
pkgver=0.1
pkgrel=1
pkgdesc="Simple, usable, elegant and clean gtk3 theme."
arch=('i686' 'x86_64')
makedepends=('findutils' 'imagemagick')
depends=('gtk-engine-murrine' 'gtk-engine-unico')
url="http://browse.deviantart.com/art/G3-Pro-353539390"
license=('LGPL3')
source=(${pkgname}_${pkgver}~ubuntu.tar.gz::http://dl.dropbox.com/u/24598537/aur/${pkgname}_${pkgver}~ubuntu.tar.gz)
md5sums=('516a0b3118121989a9da141090d622f5')

build() {
  mkdir -p ${pkgdir}/usr/share/themes/
  cd ${srcdir}/g3_pro-0.1
  cp -r "G3-Pro" "${pkgdir}/usr/share/themes"
}