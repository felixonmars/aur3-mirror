# Contributor: Rémi Audebert <quaero.galileo@gmail.com>

pkgname=python2-wikitools-svn
pkgver=391
pkgrel=1
pkgdesc="Python scripts and modules to interact with the MediaWiki API"
arch=('any')
url="http://code.google.com/p/python-wikitools/"
license=('cc-by-sa-3.0' 'GPL3')
depends=('python2'
         'python-simplejson')
optdepends=('python-poster: file upload support')
source=()
md5sums=()
makedepends=('subversion')
provides=('python2-wikitools')
conflicts=('python2-wikitools')

_svntrunk=http://python-wikitools.googlecode.com/svn/trunk
_svnmod=trunk
_svnname=wikitools

build() {
	msg "Starting SVN checkout..."
	cd ${srcdir}
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up)
	else
		svn co $_svntrunk $_svnmod
	fi
	msg "SVN checkout done or server timeout"

    cd "$srcdir/$_svnmod"

    msg "Starting setup.py..."
    python2 setup.py install --root=$pkgdir/ --optimize=1
}
