# Maintainer: Kevin Cox <kevincox.ca@gmail.com>
pkgname='keystate-git'
pkgver='1.0'
pkgrel=1
pkgdesc='A tool to get the state of keyboard keys.'
arch=('i686' 'x86_64')
url='https://bitbucket.org/kevincox/keystate'
license=('zlib')
depends=()
optdepends=()
makedepends=()
provides=('keystate')

_gitserver='https://kevincox@bitbucket.org/kevincox/keystate.git'
_gitname="$srcdir/keystate/"

build() {
	cd "$srcdir"
	msg 'Connecting to git server....'

	if [[ -d "$_gitname" ]]; then
		cd "$_gitname"

		if git pull origin ; then
			msg 'The local files have been updated.'
		else
			msg 'Problem updating sources.'
		fi
	else
		if git clone "$_gitserver" "$_gitname" ; then
			msg 'Sources successfully downloaded.'
		else
			msg 'Problem retrieving sources.'
		fi
	fi

	msg 'Starting build...'

	builddir="$srcdir/build/"
	mkdir -p "$builddir"
	cd       "$builddir"

	gen "-Dprefix=$pkgdir/usr/" -o "b.xml" "$_gitname"
	gen-makefile "b.xml"
	make install

	chmod 6555 "$pkgdir/usr/bin/keystate"
}

