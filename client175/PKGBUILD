# Maintainer: Alexander De Sousa <archaur.xandy21@spamgourmet.com>

pkgname=client175
pkgver=0.7
pkgrel=2
pkgdesc="Full featured MPD web client."
arch=('any')
url="http://code.google.com/p/client175/"
license=('GPL3')
depends=('mpd>=0.14' 'python2' 'python-beautifulsoup' 'mutagen' 'python2-cherrypy')
provides=('client175')
conflicts=('client175-svn')
backup=('opt/client175/site.conf')
install=client175.install
source=(http://client175.googlecode.com/files/client175_$pkgver.tar.gz)
sha1sums=('077bcc97ba21e27de1fc9229f8db21475f5e6d04')

build() {
	cd "$srcdir/$pkgname"

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
}

package() {
	msg2 "Installing files..."
	install -dm755 "$pkgdir/opt"	
	cp -r "$srcdir/$pkgname" "$pkgdir/opt"

	# Allow any user to write in the covers directory:
	chmod 777 "$pkgdir/opt/$pkgname/static/covers"
}

# vim: set ft=sh ts=3 sw=3 tw=0:
