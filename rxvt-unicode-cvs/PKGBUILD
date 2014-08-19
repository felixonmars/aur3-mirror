# Maintainer: David "Naypam" Trail <arch@trailbeans.eu>
# Contributor: Sébastien Luttringer <seblu@aur.archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: tobias <tobias@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Daniel Micay <danielmicay@gmail.com>

_pkgname=rxvt-unicode
pkgname=rxvt-unicode-cvs
pkgver=9.20
pkgrel=2
pkgdesc='Unicode enabled rxvt-clone terminal'
arch=('i686' 'x86_64')
url='http://software.schmorp.de/pkg/rxvt-unicode.html'
license=('GPL')
makedepends=('cvs')
depends=('libxft' 'perl' 'startup-notification' 'rxvt-unicode-terminfo')
provides=(rxvt-unicode)
conflicts=(rxvt-unicode)
source=('urxvt.desktop'
		'urxvtc.desktop'
        'font-width-fix.patch'
        'line-spacing-fix.patch')
sha1sums=('b5a4507f85ebb7bac589db2e07d9bc40106720d9'
		  '62c4ffecfce6967def394dd4d418b68652372ea2'
          '01ee8f212add79a158dcd4ed78d0ea1324bdc59b'
          'b7fde1c46af45e831828738874f14b092b1e795f')

build() {
	cvs -z3 -d :pserver:anonymous@cvs.schmorp.de/schmorpforge co rxvt-unicode 
	cd $_pkgname
	patch -p0 -i ../font-width-fix.patch
	patch -p0 -i ../line-spacing-fix.patch

	# Not including anything that's on by default
	# For speed you may want to disable frills, 256-color, unicode3, xft.
	# The "frills" are better from the latest version, typically.
	./configure \
		--prefix=/usr --with-terminfo=/usr/share/terminfo --enable-unicode3 \
		--disable-fallback --enable-frills --enable-smart-resize \
		--disable-iso14755 --disable-text-blink --disable-pointer-blank \
		--enable-256-color

	make
}

package() {
	# Install desktop icons
	for _f in urxvt urxvtc; do
		install -Dm644 $_f.desktop "$pkgdir/usr/share/applications/$_f.desktop"
	done

	cd $_pkgname

	# Workaround terminfo installation
	export TERMINFO="$srcdir/terminfo"
	install -d "$TERMINFO"
	make DESTDIR="$pkgdir" install
}

# vim:set noet:
