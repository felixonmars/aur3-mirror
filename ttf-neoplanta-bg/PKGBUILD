# Maintainer: Milos Pejovic <pejovic@gmail.com>

pkgname=ttf-neoplanta-bg
pkgver=1.0
pkgrel=1
pkgdesc="Serif OpenType Unicode font with Serbian style cyrillic cursive letters"
arch=('any')
license=('custom')
url="http://www.tipometar.org/aktuelno/akcija!/NeoplantaBG/Index.html"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=neoplanta.install
source=(http://www.tipometar.org/aktuelno/akcija!/NeoplantaBG/img/NeoplantaBG.zip)
md5sums=('a7efaa9f77683b20c703192b2f4a87e6')

build() {  
  cd ${srcdir}
  install -d -m 755 $pkgdir/usr/share/fonts/OTF || return 1  
  install -m644 *.otf $pkgdir/usr/share/fonts/OTF || return 1
}
