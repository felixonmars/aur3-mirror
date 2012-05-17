# Maintainer: kozec <kozec at kozec dot com>

pkgname=aegisub
pkgver=2.1.9
pkgrel=2
pkgdesc="A general-purpose subtitle editor with ASS/SSA support"
arch=('i686' 'x86_64')
url="http://www.aegisub.net"

license=('GPL' 'BSD')
conflicts=('aegisub-bin' 'aegisub-svn' 'aegisub-stable-svn')
source=("http://ftp.aegisub.org/pub/releases/aegisub-${pkgver}.tar.gz")

# Dependencies converted from 'Building Aegisub 2.1.9 on Ubuntu' thread,
# http://forum.aegisub.org/viewtopic.php?f=10&t=4686
depends=('imagemagick' 'gcc-libs>=4.5' 'fontconfig' 'freetype2' 'libgl'
	'mesa' 'glib2' 'lua>=5.0' 'hunspell' 'alsa-lib' 'libpulse' 'zlib'
	'wxgtk>=2.8' 'libass' 'ffmpeg>=20120127' 'ffmpegsource>=2.0')
# excluded dep: openal 

makedepends=('intltool' 'yasm')
# makedeps from base-devel: autoconf automake libtool gcc pkg-config

build() {
	cd "$srcdir/aegisub-${pkgver}"
	
	./configure --prefix=/usr --with-player-audio=alsa \
		--with-pulseaudio --without-{portaudio,openal,oss}
	
	# Solves weird, rare problem with libz not being linked
	export LDFLAGS='$LDFLAGS -lz'
	make
}


package() {
	cd "$srcdir/aegisub-${pkgver}"
	make DESTDIR="$pkgdir" install
	cd "$pkgdir/usr/bin"
	ln -s aegisub-2.1 aegisub
}

md5sums=('878cf7e6fd9c35cc218537bac3b86c25')
