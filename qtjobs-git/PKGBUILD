# Maintainer: David Watzke <david@watzke.cz>

pkgname=qtjobs-git
pkgver=20100822
pkgrel=1
pkgdesc='a xjobs-like tool with Qt4 GUI that provides a user-friendly way of multitasking'
arch=(i686 x86_64)
url='http://repo.or.cz/w/qtjobs.git'
license=('GPL')
makedepends=('git')
depends=('qt>=4.4.0')
provides=('qtjobs=0.1')
conflicts=('qtjobs')

_gitroot="git://repo.or.cz/qtjobs.git"
_gitname="qtjobs"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d "$srcdir/$_gitname" ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
		cd "$srcdir/$_gitname"
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	lrelease qtjobs.pro
	qmake qtjobs.pro
	make
}

package() {
	cd "$srcdir/$_gitname-build"
	install -D -m 755 qtjobs "$pkgdir"/usr/bin/qtjobs
	install -d -m 755 "$pkgdir"/usr/share/qtjobs/
	install -m 644 README.txt TODO.txt *.qm "$pkgdir"/usr/share/qtjobs/ 
}

# vim:set ts=2 sw=2 et:
