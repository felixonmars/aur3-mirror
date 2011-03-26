# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=gdatacopier-svn
pkgver=265
pkgrel=1
pkgdesc="A command-line tool for downloading Google Docs documents in various formats, OpenOffice and PDF among them"
arch=('any')
url="http://code.google.com/p/gdatacopier/"
license=('GPL')
depends=('python-gdata')
provides=('gdatacopier')
conflicts=('gdatacopier')

_svntrunk="http://gdatacopier.googlecode.com/svn/trunk/"
_svnmod="trunk"

build() {
	msg "Starting SVN checkout..."
	
	cd ${srcdir}
	
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi
	
	msg "SVN checkout done or server timeout"

	cd $_svnmod

	dest="$pkgdir/opt/Google/gdatacopier"
	mkdir -p $dest
	
	install -Dm 755 gcp.py $dest/gcp.py
	install -Dm 755 gls.py $dest/gls.py
	install -Dm 755 grm.py $dest/grm.py
	install -Dm 755 gmkdir.py $dest/gmkdir.py
	install -Dm 755 gmv.py $dest/gmv.py

	mkdir -p $pkgdir/usr/bin
	ln -s /opt/Google/gdatacopier/gcp.py $pkgdir/usr/bin/gcp
	ln -s /opt/Google/gdatacopier/gls.py $pkgdir/usr/bin/gls
	ln -s /opt/Google/gdatacopier/grm.py $pkgdir/usr/bin/grm
	ln -s /opt/Google/gdatacopier/gmv.py $pkgdir/usr/bin/gmv
	ln -s /opt/Google/gdatacopier/gmkdir.py $pkgdir/usr/bin/gmkdir
}
