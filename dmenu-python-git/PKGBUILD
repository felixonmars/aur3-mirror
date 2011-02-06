# Maintainer: Sara <sara @ archlinux dot us>
pkgname=dmenu-python-git
pkgver=20110120
pkgrel=1
pkgdesc="Dmenu wrappper which sorts applications by usage, indexes files, and opens files by extension."
arch=(i686 x86_64)
url="https://bbs.archlinux.org/viewtopic.php?pid=529204"
license=('BSD')
depends=(dmenu) 
makedepends=(git)
provides=(dmenu-launcher)

_gitroot=git://github.com/TheWanderer/dmenu-python.git
_gitname=dmenu-python

build(){
	cd "$srcdir"
	
	if [[ -d $_gitname ]]; then
		cd "$_gitname"
		git pull origin
		msg "The local files are updated."
	else
		git clone "$_gitroot" 
		cd "$_gitname"
	fi
	msg "Checkout done or server timeout"
}

package(){
	cd "$srcdir/$_gitname"
        sed -i 's_#!/usr/bin/python_#!/usr/bin/python2_' launch.py
	install -D launch.py "$pkgdir"/usr/bin/dmenu-launcher
}
