# Maintainer: Mark Foxwell <fastfret79@archlinux.org.uk>
pkgname=alot-git
pkgver=20120518
pkgrel=1
pkgdesc="A terminal interface for notmuch mail written in python using the urwid toolkit."
arch=('any')
url="https://github.com/pazz/alot"
license=('GPL')
depends=('python2-urwid' 'notmuch-git' 'twisted' 'python2' 'python-magic>=5.04' 'python-configobj' 'pyme')
makedepends=('git')
provides=('alot')
conflicts=('alot')

_gitroot="https://github.com/pazz/alot.git"
_gitname="master"

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
}

package() {
	
	cd "$srcdir/$_gitname-build"
	
	sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
			-e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
			$(find ./ -name '*.py')
	
	
	python2 setup.py install --prefix=${pkgdir}/usr
	
}
