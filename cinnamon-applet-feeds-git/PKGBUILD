# Maintainer: Celedhrim <celed+archlinux@ielf.org>
pkgname=cinnamon-applet-feeds-git
pkgver=0.12.r1.g7a9bfde
pkgrel=1
pkgdesc='Cinnamon applet for fetching and displaying RSS feeds (gxml version)'
url='https://github.com/lestcape/cinnamon-feeds-applet'
arch=('i386' 'x86_64')
license=('GPL')
depends=('cinnamon' 'gxml-git')
source=('feeds@jonbrettdev.wordpress.com::git+https://github.com/lestcape/cinnamon-feeds-applet.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
		git describe --long | sed 's/^FOO-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

package() {
	cd "$srcdir"
	rm -rf feeds@jonbrettdev.wordpress.com/.git
	install -d -m755 "${pkgdir}/usr/share/cinnamon/applets"
	mv feeds@jonbrettdev.wordpress.com "${pkgdir}/usr/share/cinnamon/applets"
}
