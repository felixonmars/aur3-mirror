# Maintainer: kpj <kpjkpjkpjkpjkpjkpj@com.googlemail>

__pkgname="scruffy"
pkgname="python2-${__pkgname}-git"
pkgver=20120827
pkgrel=1
pkgdesc="Creates UML diagrams using yUML-like (http://yuml.me) syntax"
arch=('any')
license=('MIT')
provides=(${__pkgname})
conflicts=('${__pkgname}')
url="https://github.com/aivarsk/scruffy/"
depends=('graphviz' 'librsvg' 'plotutils' 'python2' 'python-imaging')
makedepends=('git')

_gitroot="git://github.com/aivarsk/${__pkgname}.git"
_gitname="${__pkgname}"

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
	
	# Hinting everything at python2
	sed -i 's?^#!/usr/bin/env python$?\02?' bin/* suml/*
}

package() {
	cd "$srcdir/$_gitname-build"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}
