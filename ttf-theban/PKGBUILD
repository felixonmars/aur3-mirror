# Maintainer: ShadowKyogre <shadowkyogre@aim.com>
pkgname=ttf-theban
pkgver=1.0
pkgrel=1
pkgdesc="Also known as the Witches' Alphabet. The origins of the alphabet is unknown."
arch=('any')
url="http://www.fontsaddict.com/font/theban-alphabet.html"
license=('freeware')
makedepends=('unzip')
depends=(fontconfig xorg-font-utils)
source=("http://www.fontsaddict.com/download/theban-alphabet.ttf")
md5sums=('76c63152f6d5636f8c93868a5b1b0289')
install=$pkgname.install

build() {
	install -Dm644 "$srcdir/theban-alphabet.ttf" "$pkgdir/usr/share/fonts/TTF/theban-alphabet.ttf"
}

# vim:set ts=2 sw=2 et:
