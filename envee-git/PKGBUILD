# Maintainer: Bryan Garza <bry garza [at] g + mail.com>
pkgname=envee-git
pkgver=20120408
pkgrel=1
pkgdesc="Versatile system information script for screenshot info"
arch=(any)
url="https://github.com/wolfcore/envee"
license=('GPL3')
depends=('bash')
makedepends=('git')

_gitroot="git://github.com/wolfcore/envee.git"
_gitname="envee"
_gitbranch="master"

build() {
	# Git
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	# Create pkgdir folders
	install -d $pkgdir/usr/bin

	# Install
	cp -r envee $pkgdir/usr/bin/envee

}

