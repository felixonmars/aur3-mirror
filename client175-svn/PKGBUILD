# Maintainer: Alexander De Sousa <archaur.xandy21@spamgourmet.com>

pkgname=client175-svn
pkgver=130
pkgrel=1
pkgdesc="Full featured MPD web client, svn code."
arch=('any')
url="http://code.google.com/p/client175/"
license=('GPL3')
depends=('mpd>=0.14' 'python2' 'python-beautifulsoup' 'mutagen'
         'python2-cherrypy')
makedepends=('subversion')
provides=('client175')
conflicts=('client175')
backup=('opt/client175/site.conf')
install=client175-svn.install

_svntrunk=http://client175.googlecode.com/svn/trunk/
_svnmod=client175

build() {
	cd "$srcdir"

	if [ -d $_svnmod/.svn ]; then
		msg2 "Updating downloaded sources..."
		(cd $_svnmod && svn up --quiet -r $pkgver)
	else
		msg2 "Downloading sources from the repository..."
		svn co --quiet $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg2 "SVN checkout done or server timeout."

	# Work in a different directory:
	rm -rf "$srcdir/$_svnmod-build"
	cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
	cd "$srcdir/$_svnmod-build"

	# Use the Python 2.x interpreter instead of Python 3.x:
	sed 's|/usr/bin/env python|/usr/bin/env python2|g' -i server.py
	sed 's|/usr/bin/env python|/usr/bin/env python2|g' -i covers.py
	sed 's|/usr/bin/env python|/usr/bin/env python2|g' -i mpd_proxy2.py

	# Use system Beautiful Soup, mutagen and cherrypy:
	rm -f BeautifulSoup.py
	rm -fr mutagen
	rm -fr cherrypy

	# Set the executable bit to allow direct execution:
	chmod +x server.py

	msg2 "Removing .svn directories from build directory..."
	rm -fr `find . -type d -name .svn`
}

package() {
	msg2 "Installing files..."
	install -dm755 "$pkgdir/opt/client175"	
	cp -rT "$srcdir/client175-build" "$pkgdir/opt/client175"

	# Allow any user to write in the covers directory:
	chmod 777 "$pkgdir/opt/client175/static/covers"
}

# vim: set ft=sh ts=3 sw=3 tw=0:
