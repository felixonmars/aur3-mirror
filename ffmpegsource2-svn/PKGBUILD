# Maintainer: meowcats
pkgname=ffmpegsource2-svn
pkgver=587
pkgrel=1
pkgdesc="An FFmpeg based source library and Avisynth plugin for easy frame accurate access"
url="http://code.google.com/p/ffmpegsource/"
arch=('x86_64' 'i686')
license=('MIT')
depends=('ffmpeg')
makedepends=('subversion' 'automake' 'yasm')
conflicts=()
md5sums=()

_svntrunk="http://ffmpegsource.googlecode.com/svn/trunk/"
_svnmod="ffmpegsource-read-only"

build() {
	cd $srcdir
	msg "Connecting to the SVN server...."
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn update)
	else
		svn checkout $_svntrunk $_svnmod
	fi
		msg "SVN checkout done or server timeout"
		msg "Starting make..."
	
	if [ -d $_svnmod-build ];then
		rm -rf $_svnmod-build
	fi
	
	cp -r $_svnmod $_svnmod-build
	cd $_svnmod-build
	./configure --prefix=/usr --enable-shared --disable-static
	make
	make DESTDIR="$pkgdir" install

	rm -rf $_svnmod-build
}
