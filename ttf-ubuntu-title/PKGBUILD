# Contributor: Jakub Luzny <limoto94@gmail.com>
pkgname=ttf-ubuntu-title
pkgver=0706252006
pkgrel=3
pkgdesc="Fonts used in Ubuntu logo"
arch=(i686 x86_64)
url="https://wiki.ubuntu.com/UbuntuTitle"
license=('LGPL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=(http://nitrofurano.linuxkafe.com/linux/UbuntuTitle_0706252006.zip)
md5sums=('a7de79a798bc2939d4f242c00f0355c2')

build() {
  cd "$srcdir"
  
  mkdir -p "$pkgdir/usr/share/fonts/TTF"
  mkdir -p "$pkgdir/usr/share/$pkgname"

  install -m644 notes.txt "$pkgdir/usr/share/$pkgname"
  install -m644 ttf/*.ttf "$pkgdir/usr/share/fonts/TTF/"
}

#category: x11
# vim:set ts=2 sw=2 et:
