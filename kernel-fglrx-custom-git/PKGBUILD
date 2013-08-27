# Maintainer: Mark K Cowan <mark@battlesnake.co.uk>
pkgname=kernel-fglrx-custom-git
pkgver=0.1
pkgrel=1
pkgdesc="Script to build a recent kernel (tested on 3.4) with patch for fglrx. Installs to /usr/share/kernel-fglrx-custom. Created as I have a Radeon HD4000 series, which AMD have dropped Linux support for."
arch=( 'x86_64' )
url="https://github.com/battlesnake/kernel-fglrx-custom"
license=( 'GPL2' )
depends=( 'make' 'catalyst-hook' 'mkinitcpio' 'grub' )
makedepends=( 'git' )
provides=( 'kernel-fglrx-custom' )
source=( 'battlesnake::git+https://github.com/battlesnake/kernel-fglrx-custom.git#branch=master' )
md5sums=( 'SKIP' )

package() {
	OUTDIR="/usr/share/kernel-fglrx-custom"
	msg "Copying script to $OUTDIR/"
	mkdir -p "$pkgdir$OUTDIR"
	install -Dm744 "battlesnake/kernel-fglrx-custom.sh" "$pkgdir$OUTDIR"
	msg "kernel-fglrx-custom installed"
	msg "View the script at $OUTDIR/ in your favourite text editor, modify as needed, then run it."
}
