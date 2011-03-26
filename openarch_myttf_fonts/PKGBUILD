# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=openarch_myttf_fonts
pkgver=0.1
pkgrel=1
pkgdesc="Some cool fonts"
arch=('any')
url="http://fonts.org/"
license=('custom')
optdepends=('ttf-droid' 'ttf-ubuntu-font-family')
install=openarch_fonts.install
source=('http://ovsinc.narod.ru/fonts/coolfonts.tar.gz' 'openarch_fonts.install' 'LICENSE')


md5sums=('da5ca29a0aeb6237ffc2796afa2d9fec'
         '2799abc1089ed7c18183e664855ce202'
         '68b329da9893e34099c7d8ad5cb9c940')

build() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}"/usr/share/fonts/TTF/coolfonts
	tar xf coolfonts.tar.gz -C "${pkgdir}"/usr/share/fonts/TTF/coolfonts/
	install -m644 "${srcdir}"/LICENSE "${pkgdir}"/usr/share/fonts/TTF/coolfonts/LICENSE
}
