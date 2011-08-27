# Contributor: Perry3D <perry3d@gmail.com> 

pkgname=ogmrip-svn
pkgver=1613
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Libraries and GTK2 interface for DVD ripping using mencoder - SVN"
url="http://ogmrip.sourceforge.net/"
license=('GPL')
depends=('libdvdread' 'mplayer' 'ogmtools' 'vorbis-tools' 'lame' 'intltool' \
         'pkgconfig' 'gconf' 'libglade' 'hal' 'mkvtoolnix' 'tesseract' \
         'enchant' 'faac' 'libtheora' 'enca' 'libnotify' 'gpac')
makedepends=('perlxml' 'subversion' 'gtk-doc>=1.0')
conflicts=('ogmrip')
provides=('ogmrip')
options=(!libtool)
source=()
md5sums=()

_svntrunk=https://ogmrip.svn.sourceforge.net/svnroot/ogmrip/trunk/ogmrip 
_svnmod=ogmrip

build() { 
	cd "$srcdir"
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up)
	else
		svn co $_svntrunk $_svnmod
	fi
	msg "SVN checkout done or server timeout"
	msg "Starting make..."
	cd $_svnmod
	./autogen.sh --prefix=/usr --sysconfdir=/usr/share || return 1
	make || return 1
	make DESTDIR="${pkgdir}"/ install
} 
