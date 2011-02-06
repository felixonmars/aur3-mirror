# Contributer: Adam Killian <adamkillian@gmail.com>
pkgname=mrxvt-svn
pkgver=235
pkgrel=1
pkgdesc="Mrxvt (previously known as materm) is a multi-tabbed X terminal emulator based on rxvt code"
arch=('i686')
url="http://materm.sourceforge.net"
license=('GPL')

depends=('libpng' 'libjpeg' 'libxft' 'libxpm')
makedepends=('subversion')
replaces=('materm')
conflicts=('mrxvt')
provides=('mrxvt')

source=()
md5sums=()

_svntrunk=https://materm.svn.sourceforge.net/svnroot/materm/mrxvt05b
_svnmod=mrxvt

build() {
	cd $startdir/src

	svn co $_svntrunk $_svnmod --config-dir ./ -r $pkgver
	msg "SVN checkout done or sever timeout"
	msg "Starting make..."

	[ -d $_svnmod-build ] && rm -rf $_svnmod-build
   cp -r $_svnmod $_svnmod-build
	cd $_svnmod-build

	./bootstrap.sh
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--mandir=/usr/man \
		--enable-xft \
		--enable-text-shadow \
		--enable-frills \
		--enable-menubar \
		--enable-ourstrings \
		--enable-xim \
		--enable-thai \
		--enable-greek \
		--enable-cjk  \
		--with-save-lines=2048
	make || return 1
	make DESTDIR=${startdir}/pkg install
}
