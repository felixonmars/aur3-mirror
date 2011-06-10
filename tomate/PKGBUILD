# Maintainer: Andrew Black <agwblack at gmail dot com>
pkgname=tomate
pkgver=20110610
pkgrel=1
pkgdesc="An applet for preventing procastination based on the Pomodoro Technique"
arch=(i686 x86_64)
url="https://gitorious.org/tomate/pages/Home"
license=('GPL')
depends=(python2 pygtk)
makedepends=(git)


_gitroot="https://git.gitorious.org/tomate/tomate.git"
_gitname="tomate"

build() {
	cd "$srcdir"
	if test -d "$pkgname"; then
		cd "$pkgname"
		git pull || return 1;	
	else
		git clone "$_gitroot"
		cd "$pkgname"
	fi

	mkdir -p "$pkgdir/usr/share/tomate"
	mkdir -p "$pkgdir/usr/bin"
	install -Dm0755 *.{png,svg,py} "$pkgdir/usr/share/tomate/" 
	ln -s "/usr/share/tomate/tomate.py" "$pkgdir/usr/bin/tomate"
}
