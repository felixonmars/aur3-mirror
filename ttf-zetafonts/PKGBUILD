# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
pkgname=ttf-zetafonts
pkgver=1.0
pkgrel=4
pkgdesc="Some fonts by Zetafonts."
arch=('any')
license=('custom: Free for personal use')
url="http://www.zetafonts.com/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("arista_2_0-${pkgver}-${pkgrel}.zip::http://img.dafont.com/dl/?f=arista_2_0"
	"duepuntozero-${pkgver}-${pkgrel}.zip::http://img.dafont.com/dl/?f=duepuntozero"
	"bistecca-${pkgver}-${pkgrel}.zip::http://img.dafont.com/dl/?f=bistecca"
	"z_prozak-${pkgver}-${pkgrel}.zip::http://img.dafont.com/dl/?f=_z_prozak"
	"docporn-${pkgver}-${pkgrel}.zip::http://img.dafont.com/dl/?f=docporn"
	"antipasto-${pkgver}-${pkgrel}.zip::http://img.dafont.com/dl/?f=antipasto"
	"cibreo-${pkgver}-${pkgrel}.zip::http://img.dafont.com/dl/?f=cibreo"
)

build() {
  cd $srcdir
  install -d "${pkgdir}"/usr/share/fonts/TTF/
  install -d "${pkgdir}"/usr/share/fonts/OTF/
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/ || return 1
  install -m644 *.otf "${pkgdir}"/usr/share/fonts/OTF/ || return 1
}
md5sums=('0ff1398d4755805e928a31ed1abddbdf'
         '70ce40a8e27a6394bc531b08caceb227'
         '79830ef412f743e2c57c0a8be6ec875e'
         'e37386973a6d2b085deef43bf6970acf'
         'e5104e3708b3f390a11088450ba6133e'
         '54c31a2e89f7d2b7f531bbb4507b12ea'
         '1f071046346935a66d1469173adaa2ca')
