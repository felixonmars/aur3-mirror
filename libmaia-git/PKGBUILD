#!/bin/bash
# Maintainer: Sebastian Wiedenroth < wiedi frubar net >
# Contributor: Alireza Savand < alireza.savand with love gmail :| >

pkgname=libmaia-git
pkgver=20120202
pkgrel=1
pkgdesc="libmaia is a easy-to-use XML-RCP library for Qt4!"
arch=(any)
url="https://github.com/wiedi/libmaia"
license=("custom")
makedepends=('git')
depends=("qt")
provides=("libmaia")
conflicts=("libmaia")

_gitroot="git://github.com/wiedi/libmaia.git"
_gitname=libmaia

build() {
	cd "$srcdir"
	msg "fun begins with git server... ;)"
	
	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "the local files are updated."
	else
		msg "so let's have some fun with cloning the git repo!"
		git clone $_gitroot $_gitname
		msg "wasn't fun? cloning done!"
	fi
	
	msg "so git checkout done or maybe server timeout :|"
	msg "anyway, hold tight."
	msg "starting to make, hmmm such a lovely time :|"

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	msg "actually compiling, just started right now :D"
	qmake
	make || return 1
}

package() {
	cd "$srcdir/$_gitname-build"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm775 libmaia.a "${pkgdir}/usr/lib/libmaia.a"
        mkdir -p "${pkgdir}/usr/include/libmaia"
	install -Dm775 *.h "${pkgdir}/usr/include/libmaia/"
}
