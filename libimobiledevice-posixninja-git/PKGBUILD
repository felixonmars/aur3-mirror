# Contributor: Matthew Bauer <mjbauer95@gmail.com>
__pkgname=libimobiledevice
_pkgname=$__pkgname-posixninja
pkgname=$_pkgname-git
pkgver=20100621
pkgrel=1
pkgdesc="A protocol library to access an iPhone or iPod Touch in Linux"
arch=('i686' 'x86_64')
url="http://github.com/posixninja/$_pkgname"
license=('GPL2')
groups=()
depends=('gnutls' 'usbmuxd' 'libplist' 'glib2' 'libgcrypt')
makedepends=('git' 'make' 'gcc')
provides=("$_pkgname" "$__pkgname=1.1.0" "libiphone" "libiphone-git")
conflicts=("$_pkgname" "$__pkgname" "libiphone" "libiphone-git")
replaces=("$_pkgname" "$__pkgname" "libiphone" "libiphone-git")
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://github.com/posixninja/$__pkgname.git"
_gitname="$_pkgname"

build() {
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
	cd "$srcdir/$_gitname-build"

	./autogen.sh --prefix=/usr
	./configure --prefix=/usr

	make || return 1
	make DESTDIR=${pkgdir} install || return 1
}
