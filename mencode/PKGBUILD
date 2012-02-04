# Contributor: Chris Mortimore <chris.mortimore@googlemail.com>
pkgname=mencode
pkgver=0.1
pkgrel=1
pkgdesc="An almost frontend to mencoder"
depends=('mplayer')
url=('http://aur.archlinux.org')
source=(mencode)
md5sums=('7c9d1b317218ef6e16d8cc9df945d1d6')
build() {
	mkdir -p $startdir/pkg/usr/bin/
	install -m 755 $startdir/mencode $startdir/pkg/usr/bin/
}
