# Maintainer: Peter1
pkgname=calc-git
pkgver=20141113
pkgrel=1
pkgdesc="a simple commandline calculator - GIT Version"
arch=(any)
url="https://github.com/Cyberdog86/calc"
license=('GPL')
makedepends=('git')

_gitroot="https://github.com/Cyberdog86/calc.git"
_gitname="calc"

prepare() {
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
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
}

package() {
	cd "$srcdir/$_gitname-build"
	# Create pkgdir folders
	install -d $pkgdir/usr/bin
	install -d $pkgdir/usr/share/man/man1

	g++ -c calc.cpp	
	g++ -o calc-git calc.o
	cp calc.1 calc.1.gz
	
	# Install
	cp -r calc-git $pkgdir/usr/bin/calc-git
	cp -r calc.1.gz $pkgdir/usr/share/man/man1/calc.1.gz

	#Fix Owner Prob
	chmod 755 calc-dev

	cp -r calc-dev $pkgdir/usr/bin/calc
	
	
}
