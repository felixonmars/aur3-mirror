# Contributor: Héctor Acosta <hector.acosta@gmail.com>
pkgname=python-vim
pkgver=20120315
pkgrel=1
pkgdesc="Simple tool used to easily modify scripts inside the python interactive console"
arch=('any')
url="https://github.com/hacosta/python-vim"
options=(!emptydirs)
license=('GPL')
depends=('python')

_gitroot=git://github.com/hacosta/python-vim
_gitname=python-vim

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [[ -d "$_gitname" ]]; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone "$_gitroot" "$_gitname"
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting build..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	#
	# BUILD HERE
	#
	python setup.py install --root="$pkgdir/" --optimize=1
}
md5sums=()
