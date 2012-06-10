# Maintainer: Sindre Myren <smyrman@gmail.com>

pkgname=gitsy-git
pkgver=20120610
pkgrel=2
pkgdesc="Synchronize files via Git. Use commandline to sync."
arch=('any')
url="https://github.com/smyrman/gitsy"
license=('GPL2')
depends=('git')

_gitroot='git://github.com/smyrman/gitsy.git'
_gitname='gitsy'

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
}

package() {
	cd "$srcdir/$_gitname-build"
	install -D -m 0755 gitsy "$pkgdir/usr/bin/gitsy"
}

