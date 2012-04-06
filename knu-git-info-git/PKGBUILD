# Maintainer: decasm
pkgname=knu-git-info-git
pkgver=20120406
pkgrel=1
pkgdesc="An information summary for git similar to svn info"
url="https://github.com/knu/git-info"
license="custom"
arch="x686 x86_64"
depends=(git)
makedepends=(git)
conflicts=()
replaces=()
backup=()
install=

_gitroot="https://github.com/knu/git-info.git"
_gitname="git-info"
_gitbranch="master"
 
_source_git() {
	cd ${srcdir}

	msg "Connecting to GIT server..."

	if [ -d "${_gitname}" ]; then
		cd "${_gitname}" && git pull origin "${_gitbranch}"
		cd ..
		msg "The local files are updated."
	else
		git clone -b "${_gitbranch}" "${_gitroot}"
	fi

	msg "GIT checkout done or server timeout"
}

build() { 
	_source_git
}

package() {
	cd "$srcdir/${_gitname}"

	mkdir -p $pkgdir/usr/bin
	cp git-editor $pkgdir/usr/bin
	cp git-info $pkgdir/usr/bin
	cp git-pager $pkgdir/usr/bin

	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	cp LICENSE.txt $pkgdir/usr/share/licenses/$pkgname
}

# vim: ts=4
