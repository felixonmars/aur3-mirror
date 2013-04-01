# Maintainer: X0rg

pkgname=norwood-git
pkgver=20130401
pkgrel=1
pkgdesc='A Weston fork with lots of changes.'
arch=('any')
url="http://www.northfield.ws/"
conflicts=('weston' 'weston-git')
license=('MIT')
options=(!libtool)
depends=('libxkbcommon' 'northfield-git' 'mesa-full' 'cairo' 'poppler-glib' 'mtdev' 'libxcursor' 'pixman' 'glu')

_gitroot="https://github.com/soreau/norwood.git"
_gitname="next"

build() {
	msg "Connecting to git.freedesktop.org GIT server...."

	if [ -d "$srcdir/$_gitname" ] ; then
		cd $_gitname && git pull origin master
		msg "The local files are updated."
	else
		git clone $_gitroot "$_gitname" --depth 1
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "${srcdir}/$_gitname-build"
	cp -r "${srcdir}/$_gitname" "${srcdir}/$_gitname-build"
	cd "${srcdir}/$_gitname-build"

	./autogen.sh --prefix=/usr --libexecdir=/usr/lib/norwood
	make
}

package() {
	cd "${srcdir}/$_gitname-build"
	make DESTDIR="${pkgdir}" install

	for _c in clickdot cliptest dnd editor eventdemo flower gears image \
	 resizor simple-egl simple-shm smoke view; do
		install -Dm755 "clients/$_c" "$pkgdir/usr/bin/norwood-$_c"
	done
}

