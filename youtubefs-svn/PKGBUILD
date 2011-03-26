# Maintainer:  Matthew Bauer <mjbauer95@gmail.com>

pkgname=youtubefs-svn
pkgver=72
pkgrel=1
pkgdesc="A Youtube filesystem like GDataFS, just without Google Docs"
arch=(any)
depends=("python>=2.5" "fuse" "python-fuse")
url="http://code.google.com/p/youtubefs"
license=('custom')

_svntrunk=http://youtubefs.googlecode.com/svn/trunk/
_svnmod=trunk

build() {
	cd ${srcdir}

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
		cd $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	mkdir -p $pkgdir/usr/share/youtubefs
	rm -rf `find . -name ".svn" -type d`
	cp -r . $pkgdir/usr/share/youtubefs
	chmod +x $pkgdir/usr/share/youtubefs/youtubefs.py

	mkdir -p $pkgdir/usr/bin
	ln -s /usr/share/youtubefs/youtubefs.py $pkgdir/usr/bin/youtubefs
}
