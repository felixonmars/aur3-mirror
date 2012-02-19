#Contributor: Tom Tryfonidis <tomtryf [at] gmail [dot] com>
#Maintainer: Tom Tryfonidis <tomtryf [at] gmail [dot] com>

pkgname=socnetv-svn
pkgver=612
pkgrel=1
pkgdesc="Social Networks Analysis and Visualisation (SVN version)"
arch=('any')
url="http://socnetv.sourceforge.net/"
license=('GPL3')
depends=( 'qt')
makedepends=('subversion')
provides=('socnetv')
conflicts=('socnetv')

_svntrunk="http://socnetv.svn.sourceforge.net/svnroot/socnetv/trunk"
_svnmod="socnetv"

build() {
cd "$srcdir"/src

msg "Starting SVN checkout..."
	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi
msg "SVN checkout done or server timeout"

msg "Starting Configure..."
	cp -a ${srcdir}/${_svnmod} ${srcdir}/${_svnmod}-build
	cd ${srcdir}/${_svnmod}-build
	./configure --prefix=/usr

msg "Starting make..."
	make || return 1
	make install DESTDIR="${pkgdir}/"  || return 1

msg "Removing leftover files..."
	rm -rf ${srcdir}/${_svnmod}-build
}

