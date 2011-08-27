# Maintainer: PDG ~sHyLoCk~ <pdg@archlinux.us>
pkgname=ttf-charming
pkgver=1.0
pkgrel=1
pkgdesc="A charming free True Type Font"
arch=('i686' 'x86_64')
url="http://www.1001freefonts.com"
license=('Custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
source=(http://www.1001freefonts.com/font/ACharmingFont.zip)
md5sums=('9a7342c1d18fc283198503cc1e66bb51')
build() {
  cd $srcdir/
  mkdir -p  $pkgdir/usr/share/fonts/TTF
  install -m644 *.ttf ${startdir}/pkg/usr/share/fonts/TTF/
}