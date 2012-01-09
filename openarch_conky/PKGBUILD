# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=openarch_conky
pkgver=0.3
pkgrel=1
pkgdesc="Conky config for openarch"
groups=('openarch_gray')
arch=('any')
url="http://ovsinc.narod.ru"
license=('custom: fonts licenses')
depends=('openarch_conky_logo' 'openarch_fonts')
conflicts=('conky-colors')
install="ttf.install"
source=('conkyrc_main'
	'conkyrun'
	"http://dl.dropbox.com/u/19256622/src/$pkgname/conky-ttf.tar.gz")


build() {
	install -d -m755 "${pkgdir}"/usr/share/conky/conky_main
	install -d -m755 "${pkgdir}"/usr/share/fonts/TTF

	install -m644 "${srcdir}"/conkyrc_main "${pkgdir}"/usr/share/conky/conky_main/
	install -m755 "${srcdir}"/conkyrun "${pkgdir}"/usr/share/conky/
	install -m644 "${srcdir}"/ttf/* "${pkgdir}"/usr/share/fonts/TTF/
}
md5sums=('1ec405e03316d417bf766ffdae22be5b'
         '01e393ca2252d4075eb3056087eb0744'
         '692bed49290ad5475a3b1ef77779b2f0')
