# Contributor: Karsten Heiken <karsten[at]disposed[dot]de>

pkgname=iostvoy
pkgver=1.37
pkgrel=1
pkgdesc="Star Trek Voyager: Elite Force ported to the opensourc'ed Q3-engine. Retail game needed to play!"
arch=('i686' 'x86_64')
depends=('sdl' 'openal')
url="http://thilo.kickchat.com/efport-progress/"
license=('unknown')
depends=('openal' 'sdl' 'libvorbis' 'bash' 'libmad')
optdepends=('curl: download maps, sounds, models ingame via http/ftp')
install=iostvoy.install
source=(http://thilo.kickchat.com/efport-progress/bin/linux/io_eliteforce-$pkgver.run 
		'stvoyhm.desktop' 'stvoyHM.launcher' 'stvoyded.launcher')
md5sums=('b4c45c90800fe8681b5ecec70d21b390'
         '3ce2de8db8fbb48c21f0ae1d971f5d27'
         '732558a53241f70b301bd574adecdaab'
         '4e034dc72cee3100b06d128fd5b02a9b')

build() {
	chmod +x io_eliteforce-$pkgver.run
	./io_eliteforce-$pkgver.run --noexec --tar xf
	
	# Install correct version
	if [ "$CARCH" = "x86_64" ]; then
		# x86_64
		tar xf iostvoyHM.x86_64.tar
		install -D $srcdir/iostvefded.x86_64 \
			$pkgdir/opt/iostvoy/iostvoyded
		install -D $srcdir/iostvoyHM.x86_64 \
			$pkgdir/opt/iostvoy/iostvoyHM
	else
		# i686
		tar xf iostvoyHM.i386.tar
		install -D $srcdir/iostvefded.i386 \
			$pkgdir/opt/iostvoy/iostvoyded
		install -D $srcdir/iostvoyHM.i386 \
			$pkgdir/opt/iostvoy/iostvoyHM
	fi
	
	# Install baseEF-directory
	mkdir -p $pkgdir/opt/iostvoy/baseEF
	install -m 644 $srcdir/*.pk3 \
		$pkgdir/opt/iostvoy/baseEF/
		
	# Install launchers
	install -D $srcdir/stvoyded.launcher \
		$pkgdir/usr/bin/stvoyded
	install -D $srcdir/stvoyHM.launcher \
		$pkgdir/usr/bin/stvoyHM

	# Install Icon File
	install -D -m 644 $srcdir/stvoyhm.png \
		$pkgdir/usr/share/pixmaps/stvoyhm.png
		
	# Install Desktop File
	install -D -m 644 $srcdir/stvoyhm.desktop \
		$pkgdir/usr/share/applications/stvoyhm.desktop
}
