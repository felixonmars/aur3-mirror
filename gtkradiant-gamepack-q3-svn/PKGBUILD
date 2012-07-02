# Maintainer: iv597 <iv5970@gmail.com>
#
# Contributor: thoughtcrime

_gamepackname=Q3Pack
_gamepackshort=q3

pkgname=gtkradiant-gamepack-$_gamepackshort-svn
pkgver=80
pkgrel=1
pkgdesc="Q3A/OA gamepack for gtkradiant-svn"
arch=('x86_64' 'i686')
url="http://www.qeradiant.com/cgi-bin/trac.cgi/wiki/ZeroRadiant"
license=('unknown')
groups=()
depends=('gtkradiant')
makedepends=('subversion')
provides=("gtkradiant-gamepack-$_gamepackshort")
conflicts=("gtkradiant-gamepack-$_gamepackshort")

_svntrunk=svn://svn.icculus.org/gtkradiant-gamepacks/$_gamepackname
_svnmod=$_gamepackname

build() {
	cd "$srcdir"

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	#
	# BUILD
	#

	msg "SVN checkouts done or server timeout"
	msg "Copying files..."
	
	# copy everything
	installsdir="$pkgdir/usr/share/gtkradiant/installs"
	install -d "$installsdir"
	cp "$srcdir/$_svnmod/trunk" "$installsdir/$_gamepackname" -r

}
