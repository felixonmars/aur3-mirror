# Maintainer: Carl Reinke <mindless2112 gmail com>

pkgname=stiler-grid-git
pkgver=20140905
pkgrel=1
pkgdesc="a python script to convert any wm to tiling wm with grid window placement"
url="http://github.com/soulfx/stiler"
license=('BSD')
source=('stiler.patch')
md5sums=('418bb6c06ed8fe6afbb5b3bc2425a694')
arch=('any')
depends=('python2' 'wmctrl' 'xorg-xprop' 'xorg-xwininfo')
makedepends=('git')

_gitroot='https://github.com/soulfx/stiler.git'
_gitname='stiler'

build()
{
	cd "$srcdir"
	
	msg "Connecting to $_gitroot..."
	if [[ -d "$_gitname/.git" ]]; then
		cd "$_gitname" && git pull origin
	else
		git clone "$_gitroot"
	fi
	
	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	
	cd "$srcdir/$_gitname-build"
	
	patch -p 1 < "$srcdir/stiler.patch"
}

package()
{
	install -Dm755 "$srcdir/$_gitname-build/stiler.py"   "$pkgdir/usr/bin/stiler"
	install -Dm644 "$srcdir/$_gitname-build/README"      "$pkgdir/usr/share/doc/stiler/README"
	install -Dm644 "$srcdir/$_gitname-build/xbindkeysrc" "$pkgdir/usr/share/stiler/xbindkeysrc"
}
