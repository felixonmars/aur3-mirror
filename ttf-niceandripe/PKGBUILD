# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
pkgname=ttf-niceandripe
pkgver=1.0
pkgrel=4
pkgdesc="Some fonts * Hand by Nice and Ripe Ltd"
arch=('any')
license=('custom: Free for personal use')
url="http://www.niceandripe.com/fonts/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=(
	"hand_of_sean-${pkgver}-${pkgrel}.zip::http://img.dafont.com/dl/?f=hand_of_sean"
	"tidy_hand-${pkgver}-${pkgrel}.zip::http://img.dafont.com/dl/?f=tidy_hand"
	"seans_other_hand-${pkgver}-${pkgrel}.zip::http://img.dafont.com/dl/?f=seans_other_hand"
)

build() {
  cd $srcdir
  install -d "${pkgdir}"/usr/share/fonts/TTF/
  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/ || return 1
}
md5sums=('72d6760494fe9d9f72a8ba2dcc065ab5'
         '185933193195535e2d6f9dbf86a0d20d'
         '56813eb0d5a2dc4265c9160674f98af5')
