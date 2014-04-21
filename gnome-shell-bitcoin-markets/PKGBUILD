# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=gnome-shell-bitcoin-markets
pkgver=85.134443e
pkgrel=1
pkgdesc="Displays Bitcoin market information in the gnome shell"
arch=('any')
url="https://github.com/OttoAllmendinger/gnome-shell-bitcoin-markets"
license=('MIT')
depends=('gnome-shell>=3.10')
makedepends=('git' 'zip')
source=("git://github.com/OttoAllmendinger/gnome-shell-bitcoin-markets.git")
sha1sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"
    make
	make EXTENSION_PATH="$pkgdir/usr/share/gnome-shell/extensions/bitcoin-markets@ottoallmendinger.github.com" install
}

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
