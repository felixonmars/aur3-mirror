# Maintainer: Kozec <kozec at kozec dot com>

pkgname=aegisub-bin
pkgver=2.1.8
pkgrel=4
pkgdesc="A general-purpose subtitle editor with ASS/SSA support (repacked from official binaries)"
arch=('i686' 'x86_64')
url="http://www.aegisub.net/"
license=('BSD')
depends=('alsa-lib' 'libgl' 'gtk2' 'libsm' 'libpng12' 'libpng' 'freetype2' 'pcre')
provides=('aegisub')
conflicts=('aegisub-svn' 'aegisub')

_arch=$CARCH
[ $CARCH == i686 ] && _arch="x86"
source=( http://ftp.aegisub.org/pub/releases/aegisub-2.1.8-linux-glibc27-$_arch.tar.bz2 )
md5sums=( 058464aaee5fba6bfffed5c6d60cb992 )
[ $CARCH == i686 ] && md5sums=( a2adde8ac6147798ae667d58391e9e3f )

build() {
	cd "$srcdir"/aegisub-2.1.8-linux-glibc27-$_arch

	# Create dirs
	mkdir -p "$pkgdir"/usr/bin/
	mkdir -p "$pkgdir"/usr/share/mime/packages
	mkdir -p "$pkgdir"/usr/lib/aegisub

	# Copy aegisub
	cp -R share "$pkgdir"/usr/
	cp -R aegisub-2.1 "$pkgdir"/usr/lib/aegisub
	ln -s ../../share "$pkgdir"/usr/lib/aegisub/share

	# Symlink to /usr/bin
	ln -s "/usr/lib/aegisub/aegisub-2.1" "$pkgdir"/usr/bin/aegisub-2.1
	ln -s aegisub-2.1 "$pkgdir"/usr/bin/aegisub
	
}
