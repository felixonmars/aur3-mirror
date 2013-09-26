# Maintainer: Mark K Cowan <mark@battlesnake.co.uk>
pkgname=kernel-fglrx-legacy-git
pkgver=0.2
pkgrel=1
pkgdesc="Script to build a 3.x kernel (tested:3.4,3.11) with patch for fglrx and optional user-specified patch (tested:BFS). Installs to /usr/share/kernel-fglrx-legacy. Created as I have a Radeon HD4870 which AMD have dropped Linux support for."
arch=( 'x86_64' )
url="https://github.com/battlesnake/kernel-fglrx-custom"
license=( 'GPL2' )
depends=( 'make' 'catalyst-hook' 'mkinitcpio' 'grub' 'base-devel' 'coreutils' 'patch' )
makedepends=( 'git' )
provides=( 'kernel-fglrx-custom' )
source=( 'battlesnake::git+https://github.com/battlesnake/kernel-fglrx-custom.git#branch=master' )
md5sums=( 'SKIP' )

package() {
	OUTDIR="/usr/share/kernel-fglrx-legacy"
	msg "Copying script to $OUTDIR/"
	mkdir -p "$pkgdir$OUTDIR"
	install -Dm744 "battlesnake/kernel-fglrx-custom.sh" "$pkgdir$OUTDIR"
	install -Dm644 "battlesnake/README.md" "$pkgdir$OUTDIR"
	msg "kernel-fglrx-legacy installed"
	msg "View the script and README.md at $OUTDIR/ in your favourite text editor, modify as needed, then run it."
}
