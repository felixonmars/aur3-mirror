# Maintainer: Nixtrian (nixtrian@gmail.com)

pkgname=etk-themes-ru
pkgver=20090728
pkgrel=1
pkgdesc="ETK themes with DejaVu fonts"
license=('GPL')
url=('http://e-stuff.org')
arch=('i686' 'x86_64')
depends=('etk')
_sourceurl=http://nixtrian.narod.ru/etk-themes
source=("$_sourceurl/73225-darkness_mint_etk.edj"
"$_sourceurl/ETK_Vulcan_Classic_0_5_9_by_Ndjee.edj"
"$_sourceurl/ETK_Vulcan_Retro_0_5_8_by_Ndjee.edj"
"$_sourceurl/ETK_Vulcan_Retro_Blue_0_5_8_by_Ndjee.edj"
"$_sourceurl/MilkyETK.edj")
md5sums=('2d47f9e015bcd66b6acf74f83734011f'
'54330562cf8e1515ba2d855eb8e8fff4'
'538feb63e58b9cc5217872ebed13b46c'
'7cb93b1978e5997e45fa838b62794c43'
'05a4fdf25ec378255e0462dcecef898b')

build() {
cd "${srcdir}"

#msg "Prepare package directory structure"
install -m755 -d "${pkgdir}/usr/share/etk/themes" || return 1

#msg "Install the edjs"
install -m644 ${srcdir}/*.edj "${pkgdir}/usr/share/etk/themes" || return 1
}
