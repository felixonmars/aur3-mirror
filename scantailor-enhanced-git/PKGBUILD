# Maintainer: Max Roder <maxroder@web.de>
# PKGBUILD taken from scantailor-git, Petr Kovar <pejuko@gmail.com>

pkgname='scantailor-enhanced-git'
pkgver=20130302
pkgrel=1
pkgdesc='Interactive post-processing tool for scanned pages, enhanced branch'
arch=('i686' 'x86_64')
url='http://scantailor.sourceforge.net'
license=('GPL')
depends=('qt4' 'libjpeg' 'zlib' 'libpng' 'libtiff' 'libxrender' 'desktop-file-utils' 'xdg-utils')
makedepends=('git' 'cmake' 'boost')
conflicts=('scantailor' 'scantailor-git')
install='scantailor.install'
source=('scantailor.desktop')
sha256sums=('6c5b543a741122bb41e95f17416f1b4a65a77a729d5dad588764d038bef42672')

_gitroot="git://scantailor.git.sourceforge.net/gitroot/scantailor/scantailor"
_gitname="scantailor.git"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
		cd $_gitname
		git branch -f enhanced remotes/origin/enhanced
		git checkout enhanced
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname/build"
	mkdir -p "$srcdir/$_gitname/build"
	cd "$srcdir/$_gitname/build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$srcdir/$_gitname/build"
	make DESTDIR="$pkgdir/" install
	mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	cp "$srcdir/$_gitname/resources/appicon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/scantailor.svg"
	mkdir -p "$pkgdir/usr/share/applications"
	cp "$srcdir/../scantailor.desktop" "$pkgdir/usr/share/applications/scantailor.desktop"
} 
