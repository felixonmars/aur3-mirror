# Contributor Matthew Bauer <mjbauer95@gmail.com>

pkgname=python-gdata-svn
pkgver=864
pkgrel=1
arch=('any')
pkgdesc="Python client library for Google data APIs svn"
url="http://code.google.com/p/gdata-python-client/"
license=('APACHE')
depends=('python2>=2.6.0')
makedepends=('python2')
provides=('gdata_py' 'python-gdata=2.0.4')
replaces=('gdata_py' 'python-gdata')
conflicts=('gdata_py' 'python-gdata')

_svntrunk=http://gdata-python-client.googlecode.com/svn/trunk
_svnmod=trunk

build() {
	cd "$srcdir"

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_svnmod-build"
	cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
	cd "$srcdir/$_svnmod-build"

	python2 setup.py install --prefix=/usr --root "${pkgdir}" || return 1
}
