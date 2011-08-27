# Maintainer: Devin Cofer <ranguvar@archlinux.us>

pkgname=simulationcraft-svn
pkgdesc="A tool to simulate, analyze, and graphically display World of Warcraft combat (SVN code)"
pkgver=6692
pkgrel=1
url="http://code.google.com/p/simulationcraft/"
arch=('i686' 'x86_64')
license=('GPL3')

makedepends=()
depends=()

_svntrunk="http://simulationcraft.googlecode.com/svn/branches/cataclysm/"
_svnmod="simulationcraft"

build() {
	cd "$srcdir"
	msg2 "Peforming source checkout"
	if [ -d "$_svnmod/.svn" ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi
	msg2 "Source checkout completed or connection error"
	rm -rf $_svnmod-build
	cp -r $_svnmod $_svnmod-build

	cd $_svnmod-build/engine
	make
}
package() {
	cd "$srcdir"/$_svnmod-build/engine

	install -Dm755 simc "$pkgdir"/usr/bin/simc
}
