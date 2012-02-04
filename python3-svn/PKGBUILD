# Contributor: Georgij Kondratjev <smpuj@bk.ru>
pkgname=python3-svn
pkgver=64449
pkgrel=1
pkgdesc="Python 3000 (a.k.a. Py3k, and released as Python 3.0) is a new version of a high-level scripting language"
arch=("i686" "x86_64")
url="http://www.python.org/download/releases/3.0/"
license=("custom")
depends=(bzip2 db4.5 openssl tk sqlite3 gdbm)
makedepends=()
options=("!emptydirs")
source=()
md5sums=()

_svntrunk=http://svn.python.org/projects/python/branches/py3k
_svnmod=python

build() {
	cd $srcdir

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	mkdir $_svnmod-build
	cd $_svnmod-build
	[ `gcc --version | head -1 | awk '{print $3}'` = '4.3.0' ] && export CC="gcc $CFLAGS -fno-tree-vrp"
	../$_svnmod/configure --prefix=/usr --enable-shared --enable-ipv6
	make || return 1
	make DESTDIR=$pkgdir altinstall maninstall
	install -Dm644 ../$_svnmod/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
	cd $pkgdir/usr
	mv share/man/man1/python.1 share/man/man1/python3.1
	cd bin
	mv idle idle3
	mv pydoc pydoc3
	mv smtpd.py smtpd3.py
	ln -s python3.0 python3
	ln -s python3.0-config python3-config
}
# vim: ts=2
