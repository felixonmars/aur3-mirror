# Contributor: ihateyou
arch=(i686 x86_64)
pkgname=wcb2-git
pkgver=20110112
pkgrel=1
pkgdesc="Patched version of Ekg2"
url="https://github.com/wcb2"
license=('GPL')
depends=('aspell' 'python2' 'gnutls' 'ncurses')
makedepends=('git' 'automake')
conflicts=('ekg2')

source=()
md5sums=()

_gitname="wcb2"
_gitroot="git://github.com/wcb2/wcb2.git"
_gitbranch="experimental"

build() {
	cd ${startdir}/src
	msg "Connecting to GIT server...."
 	
	if [ ! -d ${_gitname} ]; then
		git clone ${_gitroot}
	fi	

	cd ${_gitname}
	git checkout ${_gitbranch}
	git pull

	msg "GIT checkout done or server timeout"
	msg "Starting make..."
	
	./autogen.sh
	# nasty and dirty
	sed -i 's|ncursesw/ncurses.h|ncurses.h|g' configure plugins/ncurses/ecurses.h
	./configure --prefix=/usr \
	--sysconfdir=/etc \
	--enable-unicode \
	--enable-shared \
	--with-ncurses \
	--without-readline \
	--without-gtk \
	--without-libgadu \
	--without-libgsm

	make || return 1
	make DESTDIR=$startdir/pkg/ install
}
