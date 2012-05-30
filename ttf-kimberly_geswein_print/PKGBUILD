# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=ttf-kimberly_geswein_print
pkgver=1.0
pkgrel=8
pkgdesc="Some fonts by Kimberly Geswein"
arch=('any')
url="http://www.kimberlygeswein.com/"
license=("custom: Free for personal use")
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install

source=("contrary_mary-${pkgver}-${pkgrel}.zip::http://img.dafont.com/dl/?f=contrary_mary"
	"nothing_you_could_say-${pkgver}-${pkgrel}.zip::http://img.dafont.com/dl/?f=nothing_you_could_say"
	"nothing_you_could_do-${pkgver}-${pkgrel}.zip::http://img.dafont.com/dl/?f=nothing_you_could_do"
	"swanky_and_moo_moo-${pkgver}-${pkgrel}.zip::http://img.dafont.com/dl/?f=swanky_and_moo_moo"
	"indie_flower-${pkgver}-${pkgrel}.zip::http://img.dafont.com/dl/?f=indie_flower"
	"ten_million_fireflies-${pkgver}-${pkgrel}.zip::http://img.dafont.com/dl/?f=ten_million_fireflies"
	"sekona-${pkgver}-${pkgrel}.zip::http://img.dafont.com/dl/?f=sekona"
	"gloria_hallelujah-${pkgver}-${pkgrel}.zip::http://img.dafont.com/dl/?f=gloria_hallelujah")

build() {
	cd "${srcdir}/"
	install -m755 -d "${pkgdir}/usr/share/fonts/TTF"
	install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 ./*.ttf "${pkgdir}/usr/share/fonts/TTF/"
	install -m644 ./*.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}
md5sums=('4e4a92d921c52676642cafdbae506b62'
         '097746358d3f0c62bdfe13fd2f045bd5'
         'ac0cc2d725bceb545989a099d7442b77'
         '3c12e11cc5ef65ac49f4f084b05b97cc'
         'd82c24edeeeab8133ff32ad6f1b926d0'
         '6bee97ea7d57446d9c890bdad29c12a7'
         'fca7dfe69f67c5f5daec063ccada2e1c'
         '9514286fd8563fc83db29e0c39a51018')
