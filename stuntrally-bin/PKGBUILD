# Maintainer: scrawl <scrawl@baseoftrash.de>

pkgname=stuntrally-bin
pkgver=1.8
pkgrel=1
pkgdesc="Stunt Rally game with track editor, based on VDrift and OGRE"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://code.google.com/p/vdrift-ogre"
depends=()
makedepends=()

source=(
	http://sourceforge.net/projects/stuntrally/files/${pkgver}/StuntRally-${pkgver}-linux.tar.xz/download
	https://raw.github.com/stuntrally/stuntrally/master/dist/stuntrally.desktop
	https://raw.github.com/stuntrally/stuntrally/master/dist/sr-editor.desktop
)

md5sums=('0353ccb09bc1fcb3ca9701fc332c6e07' 'ca99d2b1962d2cd453fd9416f50191ee' 'a0a1a90f77f3503966d9a93fec590d85')

build() {
	cd "${srcdir}/StuntRally-${pkgver}-linux"
	
	mkdir -p $pkgdir/opt/stuntrally/
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/applications/
	
	ln -s ../../opt/stuntrally/stuntrally $pkgdir/usr/bin/stuntrally
	ln -s ../../opt/stuntrally/sr-editor $pkgdir/usr/bin/sr-editor
	
	cp ../stuntrally.desktop $pkgdir/usr/share/applications/
	cp ../sr-editor.desktop $pkgdir/usr/share/applications/
	
	mv bin/ $pkgdir/opt/stuntrally/
	mv config/ $pkgdir/opt/stuntrally/
	mv data/ $pkgdir/opt/stuntrally/
	mv lib/ $pkgdir/opt/stuntrally/
	mv stuntrally $pkgdir/opt/stuntrally/
	mv sr-editor $pkgdir/opt/stuntrally/
}
