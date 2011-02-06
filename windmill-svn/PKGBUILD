# Contributor: David Moore <davidm@sjsoft.com>

pkgname=windmill-svn
pkgver=717
pkgrel=1
pkgdesc="A test suite for running automated functional tests on web browsers"
url="http://windmill.osafoundation.org/"
depends=('python' 'firefox' 'setuptools' 'cherrypy>=3.0.2' 'python-simplejson>=1.7.1' 'wsgi-jsonrpc' 'wsgi-xmlrpc' 'wsgi-fileserver' 'python-functest>=0.7.1')
makedepends=('subversion')
license=('APACHE')
conflicts=('windmill')
provides=('windmill')
arch=('i686' 'x86_64')
source=()
md5sums=()

_svntrunk=http://svn.osafoundation.org/windmill/trunk/
_svnmod=windmill

build() {
	cd $startdir/src

	# Subversion checkout
	svn co $_svntrunk $_svnmod
	msg "SVN checkout done or server timeout"

    cd windmill
    python setup.py install --root=$startdir/pkg
}
