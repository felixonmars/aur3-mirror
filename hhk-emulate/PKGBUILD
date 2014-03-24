# Maintainer: Andrew DeMaria (muff1nman) <ademaria@mines.edu>

pkgname=hhk-emulate
pkgver=0.0.1
pkgrel=1
pkgdesc="A layout change to emulate a Happy Hacking Keyboard for US keyboards"
arch=('any')
url="https://github.com/muff1nman/rcs/tree/master/keyboard"
license=('MIT')
depends=('xorg-setxkbmap')
source=("https://raw.githubusercontent.com/muff1nman/rcs/master/keyboard/partial")
sha256sums=('dc109ef4af86417f8d264d74d2c8f38a689a0c7dad21523d6e5a6dfaa0b1b923')

package() {
	install -Dm644 "$srcdir/partial" "$pkgdir/usr/share/X11/xkb/keycodes/hhk"
}

# vim: set ft=PKGBUILD:

