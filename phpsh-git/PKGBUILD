# Contributor: Massimiliano Torromeo <Massimiliano DOT Torromeo AT gmail DOT com>
pkgname=phpsh-git
pkgver=20121022
pkgrel=1
pkgdesc="An interactive shell for php that features readline history, tab completion and quick access to documentation."
arch=(any)
url="http://www.phpsh.org/"
license=('CUSTOM')
depends=('python2-pysqlite' 'php')
makedepends=('git' 'python2-distribute')
install=phpsh.install
source=('norootfiles.patch')

md5sums=('4fe1c73f0bccc4edc58deb8fe5091cc6')
sha1sums=('d441d1dfdd3fc7eb6df82f319b50c84821339160')

_gitroot="git://github.com/facebook/phpsh.git"
_gitname="phpsh"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	patch -p0 -i "$srcdir/norootfiles.patch"

	python2 setup.py install --root=$pkgdir
	install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
