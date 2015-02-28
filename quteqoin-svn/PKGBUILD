# Maintainer: Damien Guihal <dguihal@gmail.com>
pkgname=quteqoin-svn
pkgver=545
pkgrel=1
pkgdesc="Tool based on Qt framework to allow effective mouling on bouchots."
arch=('i686' 'x86_64')
url="https://code.google.com/p/quteqoin/"
license="GPL"
groups=()
depends=('qt4')
makedepends=('subversion')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=https://quteqoin.googlecode.com/svn/trunk/
_svnmod=quteqoin

build() {
	cd "$srcdir"
	msg "Connecting to SVN server...."

	if [[ -d "$_svnmod/.svn" ]]; then
		(cd "$_svnmod" && svn up -r "$pkgver")
	else
		svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
	fi

	msg "SVN checkout done or server timeout"
	msg "Starting build..."

	rm -rf "$srcdir/$_svnmod-build"
	svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
	cd "$srcdir/$_svnmod-build"

	#
	# BUILD HERE
	#
	qmake-qt4 PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$_svnmod-build"
	make INSTALL_ROOT="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
