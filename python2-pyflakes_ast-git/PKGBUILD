# Contributer: Piotr Husiatyński <phusiatynski@gmail.com>

pkgname="python2-pyflakes_ast-git"
pkgver=20101019
pkgrel=1
pkgdesc="faster smurfier pyflakes using _ast instead of compiler"
url="http://github.com/kevinw/pyflakes/tree/master"
depends=("python2")
makedepends=("git" "setuptools")
provides=("pyflakes" "pyflakes_ast-git")
conflicts=("pyflakes" "pyflakes_ast-git")
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
