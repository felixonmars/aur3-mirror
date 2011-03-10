# Contributor: Matthew Bauer <mjbauer95@gmail.com>
_pkgname=flashbake
pkgname=$_pkgname-git
pkgver=20100617
pkgrel=1
pkgdesc="Scripts to gather information for including in version history comments and to make using source control a bit simpler for non-technical projects."
arch=('any')
url="http://bitbucketlabs.net/flashbake/"
license=('GPL3')
depends=('python2' 'python-feedparser')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=("$_pkgname")

_gitroot="git://github.com/commandline/$_pkgname.git"
_gitname="$_pkgname"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	python setup.py install --prefix=/usr --root=$pkgdir
}
