# Maintainer: Fredrik Andersson <rfaa@gmx.com>
pkgname=derelict3-util-git
pkgver=20140809
pkgrel=1
pkgdesc="Derelict3Util - Base library for all Derelict packages."
arch=('x86_64')
license=('Boost')
depends=('dmd')
makedepends=('git')
url="https://github.com/DerelictOrg/DerelictUtil"
provides=('derelict3-util')

_gitroot='git://github.com/DerelictOrg/DerelictUtil.git'
_gitname='derelict3-util'

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [[ -d "$_gitname" ]]; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone "$_gitroot" "$_gitname"
	fi

	msg "GIT checkout done or server timeout."
}

package() {
	mkdir -p "$pkgdir/usr/include/dlang/dmd/"
	cp -r "$srcdir/$_gitname/source/derelict/" "$pkgdir/usr/include/dlang/dmd/"
}
