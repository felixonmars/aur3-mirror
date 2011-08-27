# Contributor: Mikko Sysikaski  mikko.sysikaski at gmail dot com

pkgname=pure-svn
pkgver=706
pkgrel=1
pkgdesc="Pure is a modern-style functional programming language based on term rewriting."
arch=("i686" "x86_64")
license=('GPL3')
url="http://code.google.com/p/pure-lang"
depends=('llvm' 'gsl' 'gmp' 'readline')
makedepends=('make' 'gcc' 'bison' 'flex' 'subversion')
provides=('pure')
conflicts=('pure')
source=()
md5sums=()

_svntrunk=http://pure-lang.googlecode.com/svn/trunk/pure
_svnmod=pure

build() {
	cd ${srcdir}

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting make..."

	cp -r $_svnmod $_svnmod-build
	cd $_svnmod-build

	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}
