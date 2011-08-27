# Contributer: Matthew Bauer <mjbauer95@gmail.com>
__pkgname=Reggie
_pkgname=reggie
pkgname=$_pkgname-git
pkgver=20100328
pkgrel=2
pkgdesc="Reggie! is an easy-to-use and full-featured level editor for New Super Mario Bros. Wii, created by Treeki and Tempus. (nsmbwii)"
arch=(any)
url="http://rvlution.net/$_pkgname/"
license=('custom')
depends=('python')
source=('reggie')
md5sums=('f2788d2c556bf37472a6eabf3f139344')
provides=("$_pkgname")
conflicts=("$_pkgname")

_gitroot="git://github.com/Treeki/Reggie.git"
_gitname="$__pkgname"

build() {
	cd "$srcdir"

	mkdir -p "$pkgdir/usr/bin"
	cp reggie "$pkgdir/usr/bin/$_pkgname"
	chmod +x "$pkgdir/usr/bin/$_pkgname"

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
	cd "$srcdir/$_gitname-build"

	mkdir -p "$pkgdir/usr/share/$_pkgname"
	cp -r common.py $_pkgname.py reggieextras archive.py license.txt lz77.py readme.txt reggiedata sprites.py "$pkgdir/usr/share/$_pkgname"
}
