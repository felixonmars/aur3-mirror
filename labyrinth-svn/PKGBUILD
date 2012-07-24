# Maintainer: M Rawash <mrawash@gmail.com>

pkgname=labyrinth-svn
pkgver=372
pkgrel=1
pkgdesc="A lightweight mind-mapping tool with support for image import and drawing - development version"
arch=('any')
url="http://code.google.com/p/labyrinth/"
license=('GPL')
depends=('gnome-python' 'gnome-desktop2' 'python2-numpy')
makedepends=('gnome-common' 'intltool')
conflicts=('labyrinth')
install=$pkgname.install

_svntrunk=http://labyrinth.googlecode.com/svn/trunk
_svnmod=labyrinth

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

    #use python2
    for i in `grep -Rl "/usr/bin/env" *`;do sed -i 's/python/python2/' $i;done

	./autogen.sh --prefix=/usr || return 1
    make PYTHON='/usr/bin/python2' || return 1
    make PYTHON='/usr/bin/python2' DESTDIR=${pkgdir} install
}
