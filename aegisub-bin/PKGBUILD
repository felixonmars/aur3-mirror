# Maintainer: Kozec <kozec at kozec dot com>

pkgname=aegisub-bin
pkgver=2.1.8
pkgrel=6
pkgdesc="A general-purpose subtitle editor with ASS/SSA support (repacked from official binaries)"
arch=('i686' 'x86_64')
url="http://www.aegisub.net/"
license=('BSD')
depends=('alsa-lib' 'libgl' 'gtk2' 'libsm' 'libpng12' 'libpng' 'freetype2' 'pcre' 'hunspell')
provides=('aegisub')
conflicts=('aegisub-svn' 'aegisub-stable-svn' 'aegisub')

[ $CARCH == i686 ] && _arch="x86"
[ $CARCH == i686 ] && md5sums=( a2adde8ac6147798ae667d58391e9e3f d0e889d20f446c7408afc34e817aec9d 50956805bff4336ec5491256e627dcf5 )

[ $CARCH == x86_64 ] && _arch=$CARCH
[ $CARCH == x86_64 ] && md5sums=( 058464aaee5fba6bfffed5c6d60cb992 9d01a0a71c90609c18fd1ed3ff230305 50956805bff4336ec5491256e627dcf5 )

source=( \
	http://ftp.aegisub.org/pub/releases/aegisub-2.1.8-linux-glibc27-$_arch.tar.bz2
	http://dl.dropbox.com/u/134520/.nemaz_ma/libfreetype.so.6.6.2.$CARCH.tar.gz
	aegisub
	)

build() {
	cd "$srcdir"/aegisub-2.1.8-linux-glibc27-$_arch

	# Create dirs
	mkdir -p "$pkgdir"/usr/bin/
	mkdir -p "$pkgdir"/usr/share/mime/packages
	mkdir -p "$pkgdir"/usr/lib/aegisub

	# Copy aegisub
	cp -R share "$pkgdir"/usr/
	cp -R aegisub-2.1 "$pkgdir"/usr/lib/aegisub
	cp "$srcdir"/libfreetype.so.6.6.2 "$pkgdir"/usr/lib/aegisub
	ln -s ../../share "$pkgdir"/usr/lib/aegisub/share

	# Launcher and symlink to /usr/bin
	install -m 0755 "$srcdir"/aegisub "$pkgdir"/usr/bin/aegisub-2.1
	ln -s aegisub-2.1 "$pkgdir"/usr/bin/aegisub
	
}
