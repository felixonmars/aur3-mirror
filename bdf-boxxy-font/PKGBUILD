# Maintainer: Ashren < regj_at_arch-ed_dk >
# Font author: Caffeinebasedlifeform

pkgname=bdf-boxxy-font
pkgver=0.1
pkgrel=2
pkgdesc="Terminal friendly bdf font by caffeinebasedlifeform"
arch=('i686' 'x86_64')
license=('custom' 'GPL2')
url="http://no.such.site"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=boxxy-font.install
source=(http://arch-ed.dk/wp-content/uploads/2013/08/boxxy-font-0.1.tar.gz)
md5sums=('a0d28e2ad0c35c72ded0e6b5a21c61ae')

build() {
  install -Dm644 ${srcdir}/boxxy.bdf \
	${pkgdir}/usr/share/fonts/misc/boxxy.bdf
  install -Dm644 ${srcdir}/boxxy-bold.bdf \
	${pkgdir}/usr/share/fonts/misc/boxxy-bold.bdf

}

