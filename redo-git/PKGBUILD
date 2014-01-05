# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Samuel Tardieu <sam@rfc1149.net>

_pkgname=redo
pkgname=${_pkgname}-git
pkgver=r301.33dadbf
pkgrel=3
pkgdesc='Smaller, easier, more powerful, and more reliable than make.'
url='https://github.com/apenwarr/redo/'
license=('LGPL')
arch=('any')
depends=('python2' 'sqlite3')
makedepends=('git' 'python2-markdown' 'python2-beautifulsoup4')
conflicts=($_pkgname)
provides=($_pkgname)
source=("${pkgname}::git+https://github.com/apenwarr/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	git ls-files -z | xargs -0 sed -i -e 's,\r,,' \
		-e 's,/usr/bin/python$,/usr/bin/python2,' \
		-e 's,python -mcompileall,python2 -mcompileall,' \
		-e 's,/usr/bin/env python$,/usr/bin/env python2,' \
		-e 's,#!/bin/sh,#!/usr/bin/sh,'
}

package() {
	cd "$srcdir/$pkgname"
	export PREFIX=/usr
	export DESTDIR="$pkgdir"
	minimal/do install
}

