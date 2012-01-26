# Maintainer: Alexander De Sousa <archaur.xandy21@spamgourmet.com>
# Contributor: evr <evanroman at gmail>
# Contributor: Jorge Mokross <mokross@gmail.com>

pkgname=gmplayer-svn
pkgver=2185
pkgrel=1
pkgdesc='A simple MPlayer GUI.'
arch=('i686' 'x86_64')
url='http://gnome-mplayer.googlecode.com/'
license=('GPL')
depends=('mplayer' 'dbus-glib' 'libnotify' 'gmtk-svn')
makedepends=('subversion')
install="${pkgname}.install"
conflicts=('gnome-mplayer' 'gnome-mplayer-cvs')
provides=('gnome-mplayer')

_svntrunk=http://gnome-mplayer.googlecode.com/svn/trunk
_svnmod=gnome-mplayer-read-only

build() {
	cd "${srcdir}"

	msg2 "Checking out the repository..."
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg2 "SVN checkout done or server timeout."

	rm -rf "$srcdir/$_svnmod-build"
	cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
	cd "$srcdir/$_svnmod-build"

	msg2 "Configuring..."
	./configure --prefix=/usr --sysconfdir=/etc --without-gconf
	msg2 "Building..."
	make
}

package() {
	cd "$srcdir/$_svnmod-build"

	make DESTDIR="$pkgdir/" install

	sed -i 's@Exec=gnome-mplayer %U@Exec=gnome-mplayer %F@' \
		"${pkgdir}/usr/share/applications/gnome-mplayer.desktop"
}

# vim: set ts=3 sw=3 tw=0:
