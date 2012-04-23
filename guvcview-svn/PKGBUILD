# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=guvcview-svn
pkgver=861
pkgrel=1
pkgdesc="A video viewer and capturer for the linux uvc driver"
arch=('i686' 'x86_64')
url="http://guvcview.berlios.de"
license=('GPL')
depends=('portaudio' 'gtk2' 'ffmpeg' 'v4l-utils')
optdepends=('pulseaudio: for PulseAudio support')
makedepends=('subversion')
conflicts=('guvcview')
provides=('guvcview')

_svnmod="guvcview"
_svntrunk="http://svn.code.sf.net/p/guvcview/code/trunk"

build() {
	cd "$srcdir"

	mkdir -p ~/.subversion; touch ~/.subversion/servers   

	msg "Connecting to SVN server..."
	msg "Checking out $_svnmod"
	yes "p" | svn co "$_svntrunk" "$_svnmod"
	msg "SVN checkout done or server timeout"
	
	msg "Starting build..."

	cd "$_svnmod"

	./configure --prefix=/usr
	make
}

package() {  
	cd "$srcdir/$_svnmod"

	make DESTDIR="$pkgdir" install
}
