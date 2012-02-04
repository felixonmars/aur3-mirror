# Contributor: Nathan Jones <nathanj@insightbb.com>

pkgname=hellahella-svn
pkgver=1072
pkgrel=2
pkgdesc="A web interface for hellanzb"
url="http://www.hellanzb.com/trac/hellanzb/wiki/HellaHella"
license=(BSD)
depends=('pylons>=0.9.5')
makedepends=('subversion')
conflicts=('hellahella')
provides=('hellahella')
arch=(i686 x86_64)
install=hellahella.install

source=("http://aur.archlinux.org/packages/hellahella-svn/hellahella-svn/hellahella.install")
md5sums=('502eb428f99736001d1a461a63ddc1dc')

_svntrunk=http://www.hellanzb.com/hellanzb/hellahella/trunk
_svnmod=hellahella

build() {
	cd $startdir/src

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	cp -r $_svnmod $_svnmod-build
	cd $_svnmod-build

	python ./setup.py install --root=$startdir/pkg

	rm -rf $startdir/src/$_svnmod-build
}


