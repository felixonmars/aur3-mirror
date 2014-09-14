# Maintainer: Aaron Abbott <aaron.abbott1@gmail.com>

pkgname=tilp-git
pkgver=23
pkgrel=1
pkgdesc="TI graphing calculator link/transfer program, git version"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/tilp/"
license=('GPL')
depends=('git' 'intltool' 'libticables-git' 'libtifiles-git' 'libticonv-git' 'libticalcs-git')
conflics=('tilp')
provides=('tilp')
source=('tilp.desktop' 'tilp.xml')
md5sums=('e2bb0d7ff6c3b0e60ff82213480f6d15'
         '0303100e8ccf1c92977a68f533af0887')

_gitname="tilp"
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
