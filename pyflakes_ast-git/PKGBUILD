# Contributor: Piotr Husiatyński <phusiatynski/gmail/com>
# Maintainer: Hervé Cauwelier <herve/oursours/net>

pkgname="pyflakes_ast-git"
pkgver=20110328
pkgrel=1
pkgdesc="faster smurfier pyflakes using _ast instead of compiler"
url="http://github.com/kevinw/pyflakes/tree/master"
depends=("python2")
makedepends=("git" "setuptools")
provides=("pyflakes")
conflicts=("pyflakes")
arch=("i686" "x86_64")
license=("custom")

_gitroot="git://github.com/kevinw/pyflakes.git "
_gitname="pyflakes"

build() {
	cd $startdir/src
	msg "Connecting to $_gitroot ..."
	if [ -d $startdir/src/$_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
	cd $startdir/src/$_gitname-build

	python2 setup.py install --root=${pkgdir} || return 1
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${_svnmod}/LICENSE
}
