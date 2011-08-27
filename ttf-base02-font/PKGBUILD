# Contributor: JValdezjr (jvaldezjr1@gmail.com)
# Personal, non commercial use of this font is free.

pkgname=ttf-base02-font
pkgver=1.0
pkgrel=1
pkgdesc="Base_02 font by www.stereo-type.net"
packager="JValdezjr jvaldezjr1@gmail.com"
arch=('i686' 'x86_64')
url="http://www.stereo-type.net"
license=('custom:personal')
install=ttf-base02-font.install
source=(http://www.stereo-type.net/typos/freefonts/pc/base02.ttf)
md5sums=('bddded955f139a79a1d1344476fc1be0')

build() {
        install -d $pkgdir/usr/share/fonts/TTF || return 1
        install -m644 $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF || return 1
}
