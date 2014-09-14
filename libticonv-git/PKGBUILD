# Maintainer: Aaron Abbott <aaron.abbott1@gmail.com>

pkgname=libticonv-git
pkgver=23
pkgrel=1
pkgdesc="TI character set conversion library, git version"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/tilp/"
license=('GPL')
depends=('git')
conflics=('libticonv')
provides=('libticonv')
md5sums=()

_gitname="libticonv"
_gitroot="git://git.code.sf.net/p/tilp/${_gitname}.git"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."
	
	if [[ -d "$_gitname" ]]; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone "$_gitroot"
	fi
	
	msg "GIT checkout done or server timeout"
	msg "Starting build..."

	rm -rf "${srcdir}/${_gitname}-build"
	git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
	cd "${srcdir}/${_gitname}-build"
	./configure --prefix="/usr"
	make ${MAKEFLAGS}
}

package() {
	cd "${srcdir}/${_gitname}-build"
	make DESTDIR="$pkgdir" install
}

# This is for Pacman 4.1
pkgver () {
	echo $(git rev-list --count --all)
}
